---
title: Poincare 不等式
date: 2025-05-06T22:52:58+08:00
lastmod: 2025-05-11T14:49:53+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
categories: 高等数学
publish: true
---

[🔗【知乎】 Parseval 恒等式、Wirtinger 不等式、Poincaré 不等式、等周不等式](https://zhuanlan.zhihu.com/p/592486710)

已知

- $f(0)=f(L)=0$

则

$$
\int_{0}^{L} f^{2}(x) \, \mathrm{d}x \leq \frac{L^{2}}{\pi^{2}}\int_{0}^{L} f'^{2}(x) \, \mathrm{d}x
$$

等号成立当且仅当 $f(x)=c\sin \frac{\pi}{L}x$

> [!note] 衍生形式
>
> 1.  任意区间 $(a,b)$
>     已知
>
>     - $f(a)=f(b)=0$
>
>     则 $$\int_{a}^{b} f^{2} \, \mathrm{d}x \leq \frac{(b-a)^{2}}{\pi^{2}}\int_{a}^{b} f'^{2} \, \mathrm{d}x $$

> [!hint] 证明
> 奇延拓 + [Wirtinger 不等式](./Wirtinger%20%E4%B8%8D%E7%AD%89%E5%BC%8F.md)の证明
