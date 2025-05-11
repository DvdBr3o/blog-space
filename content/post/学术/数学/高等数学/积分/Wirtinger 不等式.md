---
title: Wirtinger 不等式
date: 2025-05-06T11:48:58+08:00
lastmod: 2025-05-11T14:48:31+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
  - fourier
category: 高等数学
publish: true
---

[🔗【知乎】 Parseval恒等式、Wirtinger不等式、Poincaré不等式、等周不等式](https://zhuanlan.zhihu.com/p/592486710)

已知
- $f(-L)=f(L)$
- $\int_{-L}^{L} f(x) \, \mathrm{d}x = 0$

则
$$
\int_{-L}^{L} f^{2}(x) \, \mathrm{d}x \le \frac{L^{2}}{\pi^{2}}\int_{-L}^{L} f'^{2}(x) \, \mathrm{d}x  
$$
等号成立当且仅当 $f(x)=a\sin \frac{\pi}{L}x+b\cos \frac{\pi}{L}x$

>[!note] 衍生形式
>1. 任意区间 $(a,b)$
>	已知
>	- $f(a)=f(b)$
>	- $\int_{a}^{b} f(x) \, \mathrm{d}x=0$
>	
>	则 $$\int_{a}^{b} f^{2} \, \mathrm{d}x \leq \frac{(b-a)^{2}}{4\pi^{2}}\int_{a}^{b} f'^{2} \, \mathrm{d}x $$

>[!hint] 证明
>[Parseval 等式](../../../../../../Parseval%20%E7%AD%89%E5%BC%8F.md) + Fourier 级数逐项可导性
>
>其中逐项可导性可得
>- $a'_{n}=nb_{n}\geq b_{n}$
>- $b'_{n}=na_{n}\geq a_{n}$
