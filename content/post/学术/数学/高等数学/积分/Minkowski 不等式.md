---
title: Minkowski 不等式
date: 2025-04-28T22:19:51+08:00
lastmod: 2025-05-13T11:21:20+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
categories: 高等数学
publish: true
---

已知

- $p\geq1$
  则
  $$
  \left(\int_{a}^{b} \left|f(x)+g(x)\right|^{p} \, \mathrm{d}x \right)^{\frac{1}{p}} \le \left(\int_{a}^{b} \left|f(x)\right|^{p} \, \mathrm{d}x \right)^{\frac{1}{p}}+\left(\int_{a}^{b} \left|g(x)\right|^{p} \, \mathrm{d}x \right)^{\frac{1}{p}}
  $$

$p<1$ 反向

> [!note] 衍生形式
>
> 1.  Lp 空间范数形式 $$\lVert f+g \rVert _{L^{p}} \leq \lVert f \rVert _{L^{p}} + \lVert g \rVert _{L^{p}}$$

> [!hint] 证明
>
> 根据 $f(x)=x^{p}$ $(p>1)$ 的凸性
> $$\int_{a}^{b}|f+g|^{p}=\int_{a}^{b} |t\cdot\frac{f}{t}+(1-t)\frac{g}{1-t}|^{p}\leq t^{1-p}\int_{a}^{b} |f|^{p}+(1-t)^{1-p}\int_{a}^{b} |g|^{p} $$
> 取
>
> $$
> t=\frac{(\int_{a}^{b} |f|^{p})^{1/p} }{(\int_{a}^{b} |f|^{p})^{1/p}+(\int_{a}^{b} |g|^{p})^{1/p}}=\frac{\lVert f \rVert _{L^{p}}}{\lVert f \rVert _{L^{p}}+\lVert g \rVert _{L^{p}}}
> $$
