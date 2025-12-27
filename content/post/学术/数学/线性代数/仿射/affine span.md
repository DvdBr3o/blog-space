---
title: affine span
date: 2025-12-17T19:52:46+08:00
lastmod: 2025-12-17T19:59:34+08:00
tags:
  - 线性代数
  - 仿射
categories: 线性代数
publish: true
---

## 定义

$$
\mathrm{aff}S=\{ \lambda\boldsymbol{s}+(1-\lambda)\boldsymbol{t} | \boldsymbol{s},\boldsymbol{t}\in S \}
$$

## 性质

1. $\mathrm{aff}S$ 是[仿射集](./%E4%BB%BF%E5%B0%84%E9%9B%86.md)
2. $S\subset \mathrm{aff}S$
3. $A\subset B$ $\land$ $B$ 是仿射集 $\implies$ $\mathrm{aff}A\subset B$
4. $A\subset B \implies \mathrm{aff}A\subset \mathrm{aff}B$
	1. $A\subset B\subset \mathrm{aff}B$
	2. $\mathrm{aff}B$ 是仿射集 $\xRightarrow{性质3}$ $\mathrm{aff}A\subset \mathrm{aff}B$ 
5. $\mathrm{aff}(A\cap B)\subset(\mathrm{aff}A \cap \mathrm{aff}B)$
	1. $A\cap B\subset A \xRightarrow{性质4}\mathrm{aff(A\cap B)}\subset \mathrm{aff}A$
	2. $A\cap B\subset B \xRightarrow{性质4}\mathrm{aff(A\cap B)}\subset \mathrm{aff}B$

