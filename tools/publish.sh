#!/usr/bin/env bash

set -euo pipefail

show_help() {
  cat <<'EOF'
Usage:
  ./tools/publish.sh [commit message] [--skip-build]

Examples:
  ./tools/publish.sh
  ./tools/publish.sh "add new robotics note"
  ./tools/publish.sh --skip-build
  ./tools/publish.sh "update blog" --skip-build
EOF
}

commit_message=""
skip_build="false"

for arg in "$@"; do
  case "$arg" in
    -h|--help)
      show_help
      exit 0
      ;;
    --skip-build)
      skip_build="true"
      ;;
    *)
      if [[ -z "$commit_message" ]]; then
        commit_message="$arg"
      else
        printf 'Error: only one commit message is supported.\n' >&2
        exit 1
      fi
      ;;
  esac
done

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

branch="$(git rev-parse --abbrev-ref HEAD)"
origin_url="$(git remote get-url origin 2>/dev/null || true)"

if [[ "$branch" == "HEAD" ]]; then
  printf 'Error: detached HEAD is not supported.\n' >&2
  exit 1
fi

if [[ -z "$origin_url" ]]; then
  printf 'Error: git remote "origin" is not configured.\n' >&2
  exit 1
fi

git_push_cmd=(git push origin "$branch")

if [[ "$origin_url" == git@* || "$origin_url" == ssh://* ]]; then
  printf '[0/5] Checking SSH access to origin...\n'
  if ! GIT_SSH_COMMAND="ssh -o BatchMode=yes -o ConnectTimeout=10" git ls-remote origin HEAD >/dev/null 2>&1; then
    printf 'Error: SSH access to origin failed. Run `ssh -T git@github.com` to verify your GitHub SSH setup.\n' >&2
    exit 1
  fi
  git_push_cmd=(env GIT_SSH_COMMAND="ssh -o BatchMode=yes -o ConnectTimeout=10" git push origin "$branch")
else
  printf '[0/5] Checking HTTPS access to origin...\n'
  if ! GIT_TERMINAL_PROMPT=0 git ls-remote origin HEAD >/dev/null 2>&1; then
    printf 'Error: HTTPS access to origin failed. Configure GitHub credentials or switch the remote to SSH.\n' >&2
    exit 1
  fi
  git_push_cmd=(env GIT_TERMINAL_PROMPT=0 git push origin "$branch")
fi

if [[ "$skip_build" != "true" ]]; then
  printf '[1/5] Building site...\n'
  npm run build
  if [[ ! -f "public/index.html" ]]; then
    printf 'Error: build finished but public/index.html was not generated. Aborting publish.\n' >&2
    exit 1
  fi
else
  printf '[1/5] Skipping build.\n'
fi

printf '[2/5] Staging changes...\n'
git add -A

if git diff --cached --quiet; then
  printf 'No changes detected. Nothing to commit or push.\n'
  exit 0
fi

printf '[3/5] Files to be committed:\n'
git --no-pager diff --cached --name-status

if [[ -z "$commit_message" ]]; then
  commit_message="update blog $(date '+%Y-%m-%d %H:%M:%S')"
fi

printf '[4/5] Creating commit...\n'
git commit -m "$commit_message"

printf '[5/5] Pushing to origin/%s...\n' "$branch"
"${git_push_cmd[@]}"

printf 'Done.\n'
