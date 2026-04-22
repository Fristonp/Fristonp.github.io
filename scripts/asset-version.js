const { execSync } = require('node:child_process');

function resolveBuildVersion() {
  if (process.env.GITHUB_SHA) {
    return process.env.GITHUB_SHA.slice(0, 8);
  }

  try {
    return execSync('git rev-parse --short HEAD', {
      stdio: ['ignore', 'pipe', 'ignore']
    }).toString().trim();
  } catch {
    return Math.floor(Date.now() / 1000).toString(36);
  }
}

const buildVersion = resolveBuildVersion();

hexo.extend.helper.register('versioned_asset', function versionedAsset(path) {
  const basePath = this.url_for(path);
  const separator = basePath.includes('?') ? '&' : '?';
  return `${basePath}${separator}v=${buildVersion}`;
});
