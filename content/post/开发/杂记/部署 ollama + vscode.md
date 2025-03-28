---
title: 部署 ollama + vscode
date: 2024-12-17T18:12:13+08:00
lastmod: 2025-03-09T13:46:59+08:00
tags:
  - ollama
  - ai
publish: true
slug: 部署-ollama-and-vscode
---

>[!info] 前情提要
>cursor 贵，想想用本地 ollama 是不是就不用付费了🤤

## 本地

主力机天选感觉应该带的动大模型，所以可以试试本地部署。

### 安装 ollama

```bash
scoop install ollama
```

### 配置 ollama 开机自启

创建一个快捷方式，目标是 `<path/to>/ollama.exe serve`。

`Win+R`，将快捷方式粘贴到 `shell:startup` 的路径下。

### 配置模型

```bash
olloma pull llama3.2
# olloma pull llama3.1:8b # 这个是 continue 官方推荐但是我没下
```

### 配置 continue

vscode 安装 continue。

在 continue 的 config.json 中添加：

```json
{
  "models": [
    // ...
    {
      "title": "Llama",
      "provider": "ollama",
      "model": "llama3.2"
    }
  ],
  // ...
}
```

🔗**更多模态**：

```cardlink
url: https://docs.continue.dev/customize/context-providers#built-in-context-providers
title: "Context providers | Continue"
description: "Type '@' to select content to the LLM as context"
host: docs.continue.dev
favicon: https://docs.continue.dev/img/favicon.ico
image: https://docs.continue.dev/img/continue-social-card.png
```


Then you are good to go ~ 🎉
## 远程

嘻嘻之前买的服务器派上用场了，远程部署一个在外面轻薄本 ~~(还没买，有钱是遥遥无期)~~ 也能用上 ollama。