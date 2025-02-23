---
title: termux workaround
date: 2025-02-23T22:14:25+08:00
lastmod: 2025-02-23T22:37:39+08:00
publish: true
---

>[!note] 前情提要
>之前放弃在平板上的 termux 进行 vulkan 图形开发。现在处于学业压力要在平板上打点算法竞赛，遂为了更好的体验来点 workaround

## esc 键

默认 `esc` 键输出返回信号，为了在 `vim` 模式下不被这恶心到，需要到 `~/.termux/termux-properties` 下修改 (把这行的注释去掉):

```bash
back-key=escape
```

## nerd font

众所周知没有 nerd font 的 modern nvim 全是方框，所以必须让 termux 显示一个呆瓜字体

如 [这篇 git issue](https://github.com/lsd-rs/lsd/issues/423) 所述

1. 去 nerd font 官网下载一个我最爱的 `caskaydiacove nerd font`.
2. 将你需要的 ttf 改名为 `font.ttf` 放到 `~/.termux/` 下
3. 运行 `termux-reload-settings`
4. 大功告成！！ 🎊

>[!summary] 总结
>我只能说对于算法竞赛来说，termux 在平板上终于是能胜任了，刚好它无法支持智能提示 XD (因为 clangd 官方的 release 不提供 arm 版本 @n@，而我也不想自己 build)
