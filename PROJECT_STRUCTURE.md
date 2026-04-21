# personal-blog-hexo 文件结构说明

这份文档用来解释 `personal-blog-hexo` 目录里各个文件和文件夹的作用，方便后续自己改博客时快速定位。

## 1. 顶层结构

```text
personal-blog-hexo/
├── .github/
├── .gitignore
├── README.md
├── PROJECT_STRUCTURE.md
├── _config.yml
├── db.json
├── package.json
├── package-lock.json
├── scaffolds/
├── scripts/
├── source/
├── themes/
└── tools/
```

## 2. 你最常会修改的内容

平时最常改的通常只有这几块：

- `source/_posts/`
  写博客文章的地方，每一篇文章都是一个 Markdown 文件。

- `source/about/index.md`
  关于页内容。

- `_config.yml`
  整个博客站点的基础配置，比如标题、作者、网址、主题。

- `themes/atelier/`
  当前自定义主题，控制首页、文章页、归档页的外观和结构。

- `tools/publish.sh`
  一键构建、提交、推送博客的脚本。

## 3. 各目录和文件的作用

### `.github/`

这里放 GitHub Actions 工作流配置。

当前主要用到：

- `.github/workflows/pages.yml`

作用：

- 在你执行 `git push` 之后自动触发部署
- 自动构建 Hexo 博客
- 自动发布到 GitHub Pages

这是博客能公开到外网的关键配置之一。

### `.gitignore`

告诉 Git 哪些文件不需要提交。

当前忽略的主要是：

- `node_modules/`
- `public/`
- `.deploy_git/`
- `db.json`

也就是说，这些文件即使本地生成了，也不会被提交到 GitHub。

### `README.md`

这个文件是博客项目的使用教程。

你现在的 `README.md` 主要讲：

- 如何写文章
- 如何本地预览
- 如何提交并自动发布到外网

### `PROJECT_STRUCTURE.md`

就是你现在看到的这份文档，用来解释整个仓库结构。

### `_config.yml`

这是 Hexo 的主配置文件，整个博客最重要的配置文件之一。

当前主要负责：

- 博客标题
- 副标题
- 作者
- 网站地址
- 语言和时区
- 主题选择

比如这里定义了：

- 博客标题：`Fristonp 的学习记录`
- 副标题：`机器人方向专业学习记录`
- 网站地址：`https://Fristonp.github.io`
- 主题：`atelier`

如果以后你想改博客名称、作者名、描述，优先看这个文件。

### `db.json`

这是 Hexo 本地生成的缓存数据库文件。

作用：

- 加快 Hexo 构建速度
- 保存文章、页面、标签、分类等中间数据

这个文件是自动生成的，不需要手动编辑，也不会被提交到 GitHub。

### `package.json`

这是 Node.js 项目的配置文件。

主要包含两类信息：

1. 项目依赖
2. 可执行脚本

当前常用脚本有：

- `npm run dev`
  启动本地预览服务器

- `npm run build`
  生成静态网页

- `npm run new -- "文章标题"`
  新建文章

- `npm run publish:auto`
  自动构建、检测改动、提交并推送

### `package-lock.json`

这个文件记录依赖的精确版本。

作用：

- 保证不同机器安装出来的依赖版本一致
- 避免“我这里能跑，你那里不能跑”的情况

通常不手动改它，`npm install` 时会自动维护。

## 4. 内容相关目录

### `scaffolds/`

这里放的是 Hexo 新建文章时使用的模板。

当前主要文件：

- `scaffolds/post.md`

作用：

- 当你运行 `npm run new -- "文章标题"` 时
- Hexo 会根据这里的模板自动创建文章文件

现在模板里默认包含：

- `title`
- `date`
- `tags`
- `categories`
- `description`

### `source/`

这是博客“原始内容”的目录，也就是 Hexo 构建前真正读取的内容。

可以理解为：

- 你写的东西放在这里
- Hexo 读取这里的内容
- 最后生成网页

#### `source/_posts/`

这是文章目录。

里面每个 `.md` 文件就是一篇博客文章，例如：

- `hello-hexo.md`
- `blog-information-architecture.md`
- `slow-writing-weekday.md`

以后你写新文章，基本都在这里。

#### `source/about/`

这是单页目录。

当前有：

- `source/about/index.md`

它对应网站上的：

- `/about/`

也就是博客的“关于页”。

如果以后要增加更多页面，比如：

- 友情链接
- 项目展示
- 联系方式

通常也会在 `source/` 下面新建类似目录。

## 5. 主题相关目录

### `themes/`

这里放博客主题。

当前你正在使用的主题是：

- `themes/atelier/`

### `themes/atelier/_config.yml`

这是当前主题自己的配置文件。

它主要控制：

- 顶部导航菜单
- 首页首屏文案
- 页脚文案

也就是说：

- 博客的“站点基础信息”看根目录 `_config.yml`
- 博客的“主题展示文案”看 `themes/atelier/_config.yml`

### `themes/atelier/layout/`

这里是主题模板文件，决定页面结构。

常见文件作用如下：

- `layout.ejs`
  整个网站的外层布局，头部、底部、公共结构都在这里。

- `index.ejs`
  首页模板。

- `post.ejs`
  文章详情页模板。

- `page.ejs`
  普通独立页面模板，例如关于页。

- `archive.ejs`
  归档页模板。

- `category.ejs`
  分类页模板。

- `tag.ejs`
  标签页模板。

- `partials/`
  放可复用的小模板片段，例如分页、归档列表。

如果以后你想改首页布局、文章页排版、导航位置，通常就是改这里。

### `themes/atelier/source/`

这里放主题自己的静态资源。

当前主要有：

- `themes/atelier/source/css/style.css`
  主题样式文件，控制颜色、布局、字体、响应式效果。

- `themes/atelier/source/js/site.js`
  主题脚本文件，控制菜单展开、滚动显现等前端交互。

如果以后你想改博客外观，优先改这里。

## 6. 工具脚本目录

### `tools/`

这是你自己添加的工具脚本目录，不属于 Hexo 默认内容。

当前主要文件：

- `tools/publish.sh`

作用：

- 检测仓库是否有变化
- 自动构建博客
- 自动 `git add`
- 自动显示这次要提交的文件
- 自动提交
- 自动推送到 GitHub

你平时可以直接运行：

```bash
npm run publish:auto
```

### `scripts/`

这个目录目前是空的。

需要注意：

- `scripts/` 在 Hexo 项目里通常会被当成 JS 扩展目录自动加载
- 所以不要再把 shell 脚本放到这里
- 否则会在 `hexo generate` 时被误当成 JavaScript 解析

所以现在工具脚本放在 `tools/`，而不是 `scripts/`。

## 7. 本地生成但通常不提交的目录

虽然当前树里没有详细展开，但项目运行过程中还会出现两个常见目录：

### `node_modules/`

这里是 npm 安装的依赖包目录。

作用：

- 提供 Hexo、本地服务器、主题渲染等运行能力

这个目录很大，不会提交到 GitHub。

### `public/`

这里是 Hexo 构建后生成的静态网站目录。

作用：

- 存放最终生成的 HTML、CSS、JS、归档页、文章页等

你可以理解为：

- `source/` 是“原始内容”
- `themes/` 是“展示规则”
- `public/` 是“最终生成的网站”

GitHub Pages 自动部署时，本质上就是把构建出来的网页结果发布出去。

## 8. 一个简单的工作流理解

你平时写博客，大致就是这个流程：

1. 在 `source/_posts/` 里写文章
2. 如果需要，修改 `source/about/index.md`
3. 如果需要，修改 `_config.yml` 或主题文件
4. 运行 `npm run dev` 本地预览
5. 运行 `npm run publish:auto` 自动提交和推送
6. GitHub Actions 读取 `.github/workflows/pages.yml` 自动部署到外网

## 9. 最后可以怎么记

如果只记最重要的几个位置，可以记这张表：

| 位置 | 作用 |
| --- | --- |
| `_config.yml` | 站点主配置 |
| `source/_posts/` | 博客文章 |
| `source/about/index.md` | 关于页 |
| `themes/atelier/layout/` | 页面结构模板 |
| `themes/atelier/source/css/style.css` | 主题样式 |
| `themes/atelier/source/js/site.js` | 主题交互脚本 |
| `.github/workflows/pages.yml` | 自动部署 |
| `tools/publish.sh` | 一键提交推送脚本 |

如果以后你想继续扩展博客，我建议优先从这几处入手。
