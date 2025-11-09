---
title: Ax等于b的完整解
date: 2025-06-29T18:37:33+08:00
lastmod: 2025-10-30T18:18:48+08:00
tags:
  - 线性代数
  - 向量空间
categories: 线性代数
publish: true
---

## 约定

解 $A\boldsymbol{x}=\boldsymbol{b}$

其中 A 化简到 $R$

## 解的数量

| 条件         | 解的数量       |
| ------------ | -------------- |
| $r<m,n$      | $0$ / $\infty$ |
| $r=m<n$ 宽矮 | $1$ / $\infty$ |
| $r=n<m$ 高瘦 | $1$ / $0$      |
| $r=m=n$ 正方 | $1$            |

## 特解

令自由变量全为 $0$，解得特解解组 $\boldsymbol{x}_{p}$

## 零空间解

另其中一个自由变量为 $1$，其余为 $0$，解 $R\boldsymbol{x}=\boldsymbol{0}$ 解得向量 $\boldsymbol{x}_{n}$

对所有自由变量产生解组 $\{\boldsymbol{x}_{n}\}$ 张成空间(所有线性组合)记作零空间解

## 完整解

$\boldsymbol{x}=\{\boldsymbol{x}_{n}\}+\boldsymbol{x}_{p}$
