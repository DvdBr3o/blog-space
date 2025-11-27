---
title: 中国剩余定理 CRT
date: 2025-10-18T18:27:29+08:00
lastmod: 2025-11-09T16:39:18+08:00
tags:
  - 数论
  - 同余
categories: 数论
publish: true
---

已知
$$
\left\{ \begin{align}
x \equiv \ & b_{1} \ \mathrm{mod} \, m_{1} \\
x \equiv \ & b_{2} \ \mathrm{mod} \, m_{2} \\
 & \vdots \\
x \equiv \ & b_{k} \ \mathrm{mod} \, m_{k}
\end{align} \right. 
$$
记 
- $M_{k}=\frac{\prod m_{i}}{m_{k}}$
- $M'_{k}$ 为 $M_{k}$ 在 **mod $m_{k}$ 意义下**的逆元

则同余方程组的解为
$$
x \equiv \sum_{i=1}^{k} b_{i}M_{i}M'_{i} \ \mathrm{mod}\,\prod m_{i}
$$
