---
title: MCP 概论
date: 2025-07-16T17:44:38+08:00
lastmod: 2025-07-17T08:35:35+08:00
tags:
  - ai
  - agent
  - mcp
categories: 人工智能
publish: true
---

![image.png](https://s2.loli.net/2025/07/16/S7UNRaCbDqieKJg.png)

MCP 协议分为三个主要组件

| 组件     | 本质                                         | 主要职责              | 实际举例                                                                                                     |
| ------ | ------------------------------------------ | ----------------- | -------------------------------------------------------------------------------------------------------- |
| Host   | 一切系统环境，包括<br>- LLM 模型<br>- UI 界面<br>- 操作系统 | host client，环境交互  | deepseek, gemini，<br>用户 ui<br>文件系统                                                                       |
| Client | Agent                                      | 解析调用块，与 Server 沟通 | vscode copilot, cline, curosr                                                                            |
| Server | 待调用功能                                      | 完成功能调用返回结果        | [google-search-mcp](https://github.com/modelcontextprotocol-servers/google-search-mcp), local mcp server |

[Overview - Model Context Protocol](https://modelcontextprotocol.io/specification/2025-06-18/basic)
