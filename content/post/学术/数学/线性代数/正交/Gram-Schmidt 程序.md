---
title: Gram-Schmidt 程序
date: 2025-05-30T16:48:50+08:00
lastmod: 2025-11-28T17:08:53+08:00
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
6. 对向量组 $(\boldsymbol{A},\boldsymbol{B},\boldsymbol{C},\dots)$ 标准化，得到一组标准正交基 orthonormal set

>[!warning]
>运算过程中不要搞错正交基底向量 $\boldsymbol{A}$ 和原向量 $\boldsymbol{a}$
>尤其是当你计算出很奇怪的结果时要回来检查是否搞混