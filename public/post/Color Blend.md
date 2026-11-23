---
title: Color Blend
date: 2025-03-23T16:14:13+08:00
lastmod: 2025-04-04T00:41:40+08:00
tags:
  - vulkan
  - graphics
categories: Vulkan
publish: true
---

## 定义

如何将该 pipeline 得到的像素色彩 混合到 已有的 color buffer 上

- `srcColor` $=$ 该 pipeline 的到的像素色彩
- `dstColor` $=$ 已有的 color buffer 的色彩

## 混合公式

$$
finalColor = \left( srcColor \times srcColorBlendFactor \right)\, \mathrm{colorBlendOp}\, \left( dstColor \times dstColorBlendFactor \right)
$$

