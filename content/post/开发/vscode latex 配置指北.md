---
title: vscode latex 配置指北
date: 2025-05-04T22:02:44+08:00
lastmod: 2025-05-04T22:04:25+08:00
tags:
  - vscode
  - latex
publish: true
---

## 配置流程

1. `scoop install texlive-full`
2. vscode 安装 latex-workshop 插件
3. `settings.json` 中把 `"latex-workshop.recipes"` 中 `"xelatex"` 项提到最前
4. done！
