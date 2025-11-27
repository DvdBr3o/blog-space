---
title: k-组合
date: 2025-11-24T17:23:30+08:00
lastmod: 2025-11-24T17:28:33+08:00
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
>- $C_{k-N_{I'}+m-1}^{m-1}$ 为确定违反 $I'$ 后，剩余个数进行无穷元素组合