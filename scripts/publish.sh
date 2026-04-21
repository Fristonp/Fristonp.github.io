#!/usr/bin/env bash

set -euo pipefail

show_help() {
  cat <<'EOF'
Usage:
  ./scripts/publish.sh [commit message] [--skip-build]

Examples:
  ./scripts/publish.sh
  ./scripts/publish.sh "add new robotics note"
  ./scripts/publish.sh --skip-build
  ./scripts/publish.sh "update blog" --skip-build
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

if [[ "$branch" == "HEAD" ]]; then
  printf 'Error: detached HEAD is not supported.\n' >&2
  exit 1
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  printf 'Error: git remote "origin" is not configured.\n' >&2
  exit 1
fi

if [[ "$skip_build" != "true" ]]; then
  printf '[1/4] Building site...\n'
  npm run build
else
  printf '[1/4] Skipping build.\n'
fi

printf '[2/4] Staging changes...\n'
git add -A

if git diff --cached --quiet; then
  printf 'No changes detected. Nothing to commit or push.\n'
  exit 0
fi

if [[ -z "$commit_message" ]]; then
  commit_message="update blog $(date '+%Y-%m-%d %H:%M:%S')"
fi

printf '[3/4] Creating commit...\n'
git commit -m "$commit_message"

printf '[4/4] Pushing to origin/%s...\n' "$branch"
git push origin "$branch"

printf 'Done.\n'
