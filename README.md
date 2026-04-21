# Hexo + GitHub Pages 个人博客

这个目录是一个可直接运行的 Hexo 博客项目。

## 本地开发

```bash
cd /home/fristonp/personal-blog-hexo
npm install
npm run clean
npm run dev
```

默认访问地址：

`http://localhost:4000`

## 常用命令

```bash
npm run new -- "文章标题"
npm run build
npm run clean
npm run dev
npm run deploy
```

## GitHub Pages 部署

推荐方式是 `GitHub Actions`，适合用户主页站点。

1. 在 GitHub 创建仓库。
2. 仓库名必须是 `YOUR_GITHUB_NAME.github.io`。
3. 修改 [_config.yml](/home/fristonp/personal-blog-hexo/_config.yml) 里的 `url`：

```yml
url: https://YOUR_GITHUB_NAME.github.io
```

4. 仓库 `Settings -> Pages -> Build and deployment -> Source` 选择 `GitHub Actions`。
5. 本项目已经带有 `.github/workflows/pages.yml`，直接提交源码仓库即可自动部署。
6. 推送到 `main` 分支：

```bash
git init
git branch -M main
git add .
git commit -m "init hexo blog"
git remote add origin https://github.com/YOUR_GITHUB_NAME/YOUR_GITHUB_NAME.github.io.git
git push -u origin main
```

## 推荐仓库结构

- `main` 分支放 Hexo 源码
- Pages 由 GitHub Actions 自动发布
