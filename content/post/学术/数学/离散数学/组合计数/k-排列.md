---
title: k-排列
date: 2025-11-24T15:36:43+08:00
lastmod: 2025-12-07T18:44:03+08:00
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

则 $S$ 的 k-排列为：$$\mathrm{sum} + \sum_{I'\in I_\mathrm{finite}}(-1)^{\left|I'\right|}\frac{k!}{\prod_{i \in I'}(n_{i}+1)! \cdot (k-N_{I'})!} \cdot m^{k-N_{I'}}$$

其中
- $N_{I'}$ := 构造违反的最小元素数 = $\sum_{i \in I'}(n_{i}+1)$
	要求 $N_{I'} \leq k$

>[!hint] 记忆/证明
>- $\sum_{I'\in I_{\mathrm{finite}}}(-1)^{\left|I'\right|}$ 用于容斥原理
>- $k!$ 为待去重全排列
>- $\prod_{i\in I'}(n_{i}+1)!$ 为构造最小违反
>- $(k-N_{I'})!$ 是对剩余位置去重
>- $m^{k-N_{I'}}$ 为剩余位置全部元素任意排列，构成最小违反之上的其他违反 (如 $n_{i}+2, \dots$)

>[!note] 特化
>当 $\sum n_{i}=k$ 时退化成 k-排列 =
>
>$$\frac{k!}{\prod n_{i}!}$$

>[!note] 圆排列
>
>$$T(n)=\frac{1}{n}\sum_{d \mid n}\phi\left( \frac{n}{d} \right)m^{d}$$
>
>其中 $d$ 包括 $1$ 和 $n$ 本身