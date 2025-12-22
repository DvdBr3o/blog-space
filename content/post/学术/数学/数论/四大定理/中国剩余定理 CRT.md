---
title: 中国剩余定理 CRT
date: 2025-10-18T18:27:29+08:00
lastmod: 2025-12-07T15:02:14+08:00
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
- $M'_{k}$ 为 $M_{k}$ 在 **mod $m_{k}$ 意义下**的逆元 aka $M_{k}'=M_{k}^{-1} \ \mathrm{mod}\,m_{k}$

则同余方程组的解为

$$
x \equiv \sum_{i=1}^{k} b_{i}M_{i}M'_{i} \ \mathrm{mod}\,\prod m_{i}
$$

>[!hint] CRT is more than 解方程组
>CRT 不仅可以解同余方程组，最本质在于可以对同一个变量**整合模数**
>比如 $a^{7}\equiv a\ \mathrm{mod}\,7,a^{7}\equiv a \ \mathrm{mod}\,9 \xRightarrow{\mathrm{CRT}} a^{7}\equiv a \cdot 9 \cdot 4+a\cdot7\cdot 4\equiv64a\equiv a\ \mathrm{mod}\,63$