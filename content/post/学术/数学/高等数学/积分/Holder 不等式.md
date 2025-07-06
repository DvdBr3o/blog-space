---
title: Holder 不等式
date: 2025-04-29T10:24:35+08:00
lastmod: 2025-05-11T13:20:18+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
categories: 高等数学
publish: true
---

已知

- $\frac{1}{p}+\frac{1}{q}=1$
- $p>1$

则

$$
\int_{a}^{b} \left|f(x)g(x)\right| \, \mathrm{d}x \le \left(\int_{a}^{b} \left|f(x)\right|^{p} \, \mathrm{d}x \right)^{\frac{1}{p}} \left(\int_{a}^{b} \left|g(x)\right|^{q} \, \mathrm{d}x \right)^{\frac{1}{q}}
$$

$p<1$ 反向

> [!note] 衍生形式
>
> 1.  [Lp 空间范数](../../../../../../Lp%20%E7%A9%BA%E9%97%B4%E8%8C%83%E6%95%B0.md)形式 $$\lVert fg \rVert _{L^{1}} \leq \lVert f \rVert _{L^{p}} \cdot\lVert g \rVert _{L^{q}}$$

> [!hint] 证明
>
> **引理 (Young 不等式)** $ab\leq \frac{a^{p}}{p}+\frac{b^{q}}{q}$
> 证明 根据 $f(x)=\ln x$ 的凸性
> $$\ln ab=\frac{1}{p}\ln a^{p}+\frac{1}{q}\ln a^{q}\leq \ln(\frac{a^{p}}{p}+\frac{a^{q}}{q})$$
>
> ---
>
> 把定积分看做常数
> $$\frac{|fg|}{{(\int_{a}^{b} |f|^{p})^{1/p} (\int_{a}^{b} |g|^{q})^{1/q}}}=\frac{|f|}{(\int_{a}^{b}|f|^{p})^{1/p}}\cdot\frac{|g|}{(\int_{a}^{b}|g|^{q})^{1/q}}\leq \frac{|f|^{p}}{p \int_{a}^{b}|f|^{p}}+\frac{|g|^{q}}{q\int_{a}^{b}|g|^{q}}$$
> 两边同时积分
> $$\frac{\int_{a}^{b} |fg|}{(\int_{a}^{b} |f|^{p})^{1/p} (\int_{a}^{b} |g|^{q})^{1/q}} \leq \frac{\int_{a}^{b} |f|^{p}}{p\int_{a}^{b} |f|^{p}}+\frac{\int_{a}^{b}|g|^{q}}{q\int_{a}^{b} |g|^{q}}=\frac{1}{p}+\frac{1}{q}=1$$
>
> 所以得证
