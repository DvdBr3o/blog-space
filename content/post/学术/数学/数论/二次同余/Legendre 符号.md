---
title: Legendre 符号
date: 2025-11-03T20:28:51+08:00
lastmod: 2025-11-03T21:16:21+08:00
tags:
  - 数论
  - 同余
categories: 数论
publish: true
---

## 定义

$$
\left(\frac{a}{p}\right)=\left\{\begin{align}
 & 1 & \mathrm{when}  & \ a \, 是 \, p \, 二次剩余 \\
 & -1 & \mathrm{when}  & \ a \, 不是 \, p \, 二次剩余 \\
 & 0 & \mathrm{when}  & \  p | a
\end{align}\right.
$$

## 计算

若
- $p$ 是奇素数
- $(a,p)=1$
则

$$
\left(\frac{a}{p}\right)\equiv a^{\frac{p-1}{2}} \ \mathrm{mod}\,p
$$
