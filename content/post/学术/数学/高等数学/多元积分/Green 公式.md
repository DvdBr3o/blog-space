---
title: Green 公式
date: 2025-01-12T16:41:06+08:00
lastmod: 2025-05-11T16:39:00+08:00
tags:
  - 高等数学
  - 多元
  - 积分
  - 曲线
categories: 高等数学
publish: true
---

## 定义

### 连通区域

连通区域分为：
+ 单连通区域
+ 多连通区域

### 正向约定

规定第二型曲线正向 $:=$ 曲线**左侧**是曲线围成的连通区域
(跟生活中跑步跑道的正向一致)

## 格林公式

已知：
- $P(x,y)$ 和 $Q(x,y)$ 在 **有界闭区域$D$** 有连续一阶偏导
- $D$ 的边界 $L$ 逐段光滑

则
$$
\oint_{L+}P\,dx+Q\,dy=\iint_{D}\left( \frac{\partial Q}{\partial x}-\frac{\partial P}{\partial y} \right)\,dx\,dy
$$
