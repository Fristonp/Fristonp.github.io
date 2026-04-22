# Fristonp 博客使用教程

这个项目是一个基于 `Hexo + GitHub Pages` 的个人博客。

仓库地址：

- `https://github.com/Fristonp/Fristonp.github.io`

线上地址：

- `https://Fristonp.github.io`

这份 README 只讲一件事：`如何写文章并发表到外网`。

## 1. 项目位置

本地项目目录：

```bash
/home/fristonp/personal-blog-hexo
```

进入项目：

```bash
cd /home/fristonp/personal-blog-hexo
```

## 2. 第一次使用

如果你换了电脑，或者刚把项目拉下来，先安装依赖：

```bash
npm install
```

## 3. 新建一篇文章

使用下面的命令创建文章：

```bash
npm run new -- "文章标题"
```

例如：

```bash
npm run new -- "机器人运动控制学习笔记"
```

执行后，Hexo 会在下面这个目录生成一个 Markdown 文件：

```bash
source/_posts/
```

比如：

```bash
source/_posts/机器人运动控制学习笔记.md
```

## 4. 文章文件长什么样

新文章默认会长这样：

```md
---
title: 文章标题
date: 2026-04-21 22:00:00
tags:
categories:
description:
---

在这里开始写正文。
```

这些字段的含义：

- `title`：文章标题
- `date`：发布时间
- `tags`：标签，比如 `控制`、`ROS`、`SLAM`
- `categories`：分类，比如 `专业学习`、`项目记录`
- `description`：文章摘要，会显示在首页和列表页

推荐这样写：

```md
---
title: 机器人运动控制学习笔记
date: 2026-04-21 22:00:00
tags:
  - 机器人
  - 运动控制
categories:
  - 专业学习
description: 记录机器人运动控制中的基础概念、控制方式和学习过程中的关键理解。
---

这篇文章用来整理机器人运动控制的基础知识。
```

## 5. 正文怎么写

博客正文使用 `Markdown`。

常用写法如下：

### 标题

```md
# 一级标题
## 二级标题
### 三级标题
```

### 列表

```md
- 第一项
- 第二项
- 第三项
```

### 编号列表

```md
1. 第一步
2. 第二步
3. 第三步
```

### 加粗和代码

```md
这是 **重点内容**
运行命令：`npm run dev`
```

### 代码块

```md
~~~cpp
#include <iostream>
int main() {
  std::cout << "hello";
}
~~~
```

### 插入链接

```md
[我的 GitHub](https://github.com/Fristonp)
```

## 6. 如何本地预览

写文章时，建议开本地预览：

```bash
npm run dev
```

然后浏览器打开：

```text
http://localhost:4000
```

这样你每次保存文章后，页面一般会自动刷新。

## 7. 如何重新生成静态页面

如果你只是想检查构建是否正常，可以运行：

```bash
npm run build
```

如果想先清理缓存再生成：

```bash
npm run clean
npm run build
```

## 8. 如何把文章发布到外网

这个项目已经配置好了 `GitHub Actions` 自动部署。

你不需要手动上传 `public` 文件夹，只需要把源码推到 `main` 分支。

标准流程：

```bash
cd /home/fristonp/personal-blog-hexo
git add .
git commit -m "write new post"
git push
```

推送后会自动触发 GitHub Actions。

Actions 成功后，网站就会更新到：

```text
https://Fristonp.github.io
```

## 9. 如何检查发布是否成功

可以看 GitHub Actions 页面：

- `https://github.com/Fristonp/Fristonp.github.io/actions`

如果工作流状态是：

- `success`

说明发布成功。

如果网站还没立刻变化，通常等几十秒到几分钟缓存刷新就可以了。

## 10. 一篇文章从写到发布的完整示例

### 第一步：创建文章

```bash
cd /home/fristonp/personal-blog-hexo
npm run new -- "ROS 学习记录（一）"
```

### 第二步：编辑文章

打开：

```bash
source/_posts/ROS-学习记录（一）.md
```

然后写内容，例如：

```md
---
title: ROS 学习记录（一）
date: 2026-04-21 22:10:00
tags:
  - ROS
  - 机器人
categories:
  - 专业学习
description: 记录 ROS 的基础概念、节点通信方式和学习中的关键问题。
---

## 1. 什么是 ROS

ROS 是机器人开发中常见的软件框架。

## 2. 这次学习的重点

- 节点
- 话题
- 服务
```

### 第三步：本地查看效果

```bash
npm run dev
```

打开：

```text
http://localhost:4000
```

### 第四步：提交并发布

```bash
git add .
git commit -m "add ROS study note"
git push
```

## 11. 文章写作建议

你这个博客目前适合写这些内容：

- 机器人方向课程笔记
- 控制、感知、路径规划相关学习记录
- ROS、SLAM、机械臂、视觉等专题整理
- 实验报告式总结
- 项目开发过程记录

建议每篇文章尽量包含这几部分：

1. 这篇文章在解决什么问题
2. 你学到了哪些关键点
3. 哪些地方容易搞混
4. 后续还要继续补什么

## 12. 常用命令汇总

```bash
cd /home/fristonp/personal-blog-hexo
npm install
npm run new -- "文章标题"
npm run dev
npm run clean
npm run build
git add .
git commit -m "update blog"
git push
```

## 13. 当前最常用的工作流

平时你只需要记住这 4 步：

1. `npm run new -- "文章标题"`
2. 编辑 `source/_posts/` 里的文章
3. `npm run dev` 本地预览
4. `git add . && git commit -m "..." && git push`

## 14. 备注

- 博客源码在 `main` 分支
- GitHub Pages 会自动发布
- 线上地址固定为 `https://Fristonp.github.io`
- 关于页文件在 `source/about/index.md`
- 文章文件都在 `source/_posts/`

## 15. 如何删除文档（详细）

这里的“文档”主要分两类：

- 文章：`source/_posts/*.md`
- 页面：例如 `source/about/index.md`

### 15.1 删除一篇文章

1. 先确认文件名：

```bash
ls source/_posts
```

2. 删除目标文章（示例）：

```bash
git rm "source/_posts/hello-hexo.md"
```

3. 本地构建确认无报错：

```bash
npm run build
```

4. 提交并发布：

```bash
git commit -m "delete post: hello-hexo"
git push
```

### 15.2 删除一个页面（例如关于页）

删除文件：

```bash
git rm "source/about/index.md"
```

然后构建检查：

```bash
npm run build
```

如果构建正常，再 `git commit` + `git push`。

### 15.3 一次删除多篇文章

建议先看清楚再删：

```bash
ls source/_posts
git rm source/_posts/文章1.md source/_posts/文章2.md
npm run build
git commit -m "delete selected posts"
git push
```

### 15.4 误删后的恢复方法

如果文件还没提交，可以恢复工作区：

```bash
git restore source/_posts source/about
```

如果已经提交了删除，按提交号恢复单个文件（示例）：

```bash
git checkout <commit_id> -- source/_posts/hello-hexo.md
```

### 15.5 避免 `File not found` 的关键检查

删除文档后，一定执行：

```bash
npm run build
```

确认日志里不是 `0 files generated`，并且 `public/index.html` 存在：

```bash
test -f public/index.html && echo "index ok" || echo "index missing"
```

如果 `index missing`，不要发布，先恢复至少一个页面或文章再构建。
