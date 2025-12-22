---
title: k-组合
date: 2025-11-24T17:23:30+08:00
lastmod: 2025-12-08T18:31:50+08:00
tags:
  - 离散数学
  - 组合
  - 计数
categories: 离散数学
publish: true
---

已知
- 重复集 $S=\left\{ n_{i} \cdot a_{i} \dots \right\}$ 共 $m$ 种
- 有穷集 $I_{\mathrm{finite}}= \left\{ i | n_{i} < \infty \right\}$

则 $S$ 的 k-组合为

$$
\mathrm{sum} + \sum_{I'\in I_{\mathrm{finite}},N_{I'}\leq k} (-1)^{\left|I'\right|}C_{k-N_{I'}+m-1}^{m-1}
$$

>[!hint] 记忆/证明
>- $\sum_{I'\in I_{\mathrm{finite}},N_{I'}\leq k} (-1)^{\left|I'\right|}$ 用于构造容斥原理
>- $C_{k-N_{I'}+m-1}^{m-1}$ 为确定违反 $I'$ (取 $n_{i}+1$)后，剩余个数进行无穷元素组合

>[!note] 特化
>
>当没有有穷集时，即重复集都是 $\left\{\infty \cdot a_{i}\dots\right\}$ 时，k-组合为 $$C_{k+m-1}^{m-1}$$
>
>$k$ 个苹果，$m$ 个幽灵苹果，$k+m-1$ 个空，$m-1$ 个插板