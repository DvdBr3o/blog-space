---
title: viewport & scissor
date: 2025-03-23T16:11:26+08:00
lastmod: 2025-04-04T00:42:15+08:00
tags:
  - vulkan
  - graphics
categories: Vulkan
publish: true
---

## viewport

定义如何 NDC $\Rightarrow$ 屏幕坐标

## scissor

指定哪个区域的像素被渲染
其余部分都不渲染

## 常规指定

```
viewport
	.offset = {0, 0}
	.width = window.width
	.height = window.height
scissor
	.offset = {0, 0}
	.extent = { window.width, window.height }
```
