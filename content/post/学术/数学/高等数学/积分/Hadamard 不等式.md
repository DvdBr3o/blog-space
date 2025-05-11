---
title: Hadamard 不等式
date: 2025-04-17T18:34:23+08:00
lastmod: 2025-05-11T13:21:42+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
  - 放缩
categories: 高等数学
publish: true
---

已知
- $f(x)$ 是 $(a,b)$ 上的下凸函数
- $\forall(x_{1},x_{2})\subset(a,b)$

则

$$
f\left( \frac{x_{1}+x_{2}}{2} \right)\leq \frac{\int_{x_{1}}^{x_{2}} f(t) \, \mathrm{d}t}{(x_{2}-x_{1})}\leq \frac{f(x_{1})+f(x_{2})}{2} 
$$

>[!hint] 证明
>1. 根据凸性得到 $f''(x)>0$ 或 $f''(x)<0$
>2. 泰勒展开
>	1. 左边 $x$ 对 $\frac{a+b}{2}$ 展开
>	2. 右边 $a$ 对 $x$ 展开
>3. 放缩掉 $f''$ 项得到不等式
>4. 两边对 $[a,b]$ 积分

