---
title: Schwarz 不等式
date: 2025-04-28T21:36:45+08:00
lastmod: 2025-05-04T23:26:32+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
categories: 高等数学
publish: true
---

$$
\int_{a}^{b} f^{2}(x) \, \mathrm{d}x\int_{a}^{b} g^{2}(x) \, \mathrm{d}x \geq \left(\int_{a}^{b} f(x)g(x) \, \mathrm{d}x \right)^{2}
$$

> [!hint] 证明
>
> $$
> \begin{align}
> \int_{a}^{b} \left(f(x)+\lambda g(x)\right)^{2} \, \mathrm{d}x & =\int_{a}^{b} \lambda^{2}g^{2}(x)+2f(x)g(x)\lambda+f^{2}(x) \, \mathrm{d}x \\
>  & =\left(\int_{a}^{b} g^{2}(x) \, \mathrm{d}x \right)\lambda^{2}+2\left(\int_{a}^{b} f(x)g(x) \, \mathrm{d}x \right)\lambda+\int_{a}^{b} f^{2}(x) \, \mathrm{d}x \\
>  & \geq 0
> \end{align}
> $$
>
> 所以
>
> $$
> \Delta=4\left(\int_{a}^{b} f(x)g(x) \, \mathrm{d}x \right)^{2}-4\int_{a}^{b} f^{2}(x) \, \mathrm{d}x\int_{a}^{b} g^{2}(x) \, \mathrm{d}x \leq 0
> $$
>
> 得到 Schwarz 不等式
