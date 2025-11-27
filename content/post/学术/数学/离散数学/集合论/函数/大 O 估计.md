---
title: 大 O 估计
date: 2025-11-27T15:57:02+08:00
lastmod: 2025-11-27T19:48:08+08:00
tags:
  - 离散数学
  - 函数
categories: 离散数学
publish: true
---

## 定义

已知
- 函数 $f$ 和函数 $g$

则 $f\in O(g)$ :=

$$
\exists C>0 \ \exists k \ \forall x>k \ (\left|f(x)\right| \leq C\left|g(x)\right|)
$$

aka

$$
\exists C(C>0 \land \exists k \forall x(x>k \to \left|f(x)\right| \leq C\left|g(x)\right|))
$$

>[!warning] 注意量词顺序
>注意大 O 估计定义的量词顺序，改变顺序会导致不等价

## 性质

>[!info] 约定
>已知
>- $f_{1}\in O(g_{1})$
>- $f_{2}\in O(g_{2})$

0. 常见函数的大 $O$ 估计排序
	$\log n << n << n^{\alpha} << \alpha^{n} << n!$
1. $f_{1}+f_{2}\in O(\mathrm{max}(g_{1}, g_{2}))$
2. $f_{1} \cdot f_{2} \in O(g_{1} \cdot g_{2})$
