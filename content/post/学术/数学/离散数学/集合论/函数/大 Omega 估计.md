---
title: 大 Omega 估计
date: 2025-11-27T16:08:39+08:00
lastmod: 2025-11-27T16:13:53+08:00
tags:
  - 离散数学
  - 函数
categories: 离散数学
publish: true
---

## 定义

已知
- 函数 $f$ 和函数 $g$

则 $f\in \Omega(g)$ :=

$$
\exists C>0 \ \exists k \ \forall x>k \ (\left|f(x)\right| \geq C\left|g(x)\right|)
$$

aka

$$
\exists C(C>0 \land \exists k \forall x(x>k \to \left|f(x)\right| \geq C\left|g(x)\right|))
$$

## 性质

1. 若 $f_{1}\in O(g_{1}) \land f_{2}\in\Omega(g_{2})$ 则 $f_{1}/f_{2} \in O(g_{1}/g_{2})$

