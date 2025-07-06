---
title: Gram-Schmidt 程序
date: 2025-05-30T16:48:50+08:00
lastmod: 2025-06-29T23:22:58+08:00
tags:
  - 线性代数
  - 正交
categories: 线性代数
publish: true
---

1. 选定任意向量组 $(\boldsymbol{a},\boldsymbol{b},\boldsymbol{c},\dots)$
2. $\boldsymbol{A}=\boldsymbol{a}$
3. $\boldsymbol{B}=\boldsymbol{b}-\displaystyle\frac{\boldsymbol{A}^{T}b}{\boldsymbol{A}^{T}\boldsymbol{A}}\boldsymbol{A}$
4. $\boldsymbol{C}=\boldsymbol{c}-\displaystyle\frac{\boldsymbol{A}^{T}\boldsymbol{c}}{\boldsymbol{A}^{T}\boldsymbol{A}}\boldsymbol{A}-\displaystyle\frac{\boldsymbol{B}^{T}\boldsymbol{c}}{\boldsymbol{B}^{T}\boldsymbol{B}}\boldsymbol{B}$
5. $\dots$
6. 对向量组 $(\boldsymbol{A},\boldsymbol{B},\boldsymbol{C},\dots)$ 标准化，得到一组标准正交基
