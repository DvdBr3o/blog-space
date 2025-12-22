---
title: QR 分解
date: 2025-05-30T16:49:24+08:00
lastmod: 2025-11-28T15:57:42+08:00
tags:
  - 线性代数
  - 正交
categories: 线性代数
publish: true
---

若
- 矩阵 $A$
- $A$ 列向量线性无关

则矩阵 $A$ 存在 QR 分解

$$
A=QR
$$

:=

$$
\begin{pmatrix}
\boldsymbol{a}_{1} \dots \boldsymbol{a}_{n}
\end{pmatrix}=\begin{pmatrix}
\boldsymbol{p}_{1}\dots \boldsymbol{p}_{n}
\end{pmatrix} \begin{pmatrix}
\lvert \boldsymbol{a}_{1} \rvert  &\hat{x}_{2,1}\lvert \boldsymbol{a}_{1} \rvert  & \dots  & \hat{x}_{n,1}\lvert \boldsymbol{a}_{1} \rvert \\
0 & \lvert \boldsymbol{a}_{2} \rvert  & \dots  & \hat{x}_{n,2}\lvert \boldsymbol{a}_{2} \rvert \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \dots & \lvert \boldsymbol{a}_{n} \rvert
\end{pmatrix}
$$

其中

- $Q=\begin{pmatrix}\boldsymbol{p}_{k} \dots\end{pmatrix}$ 是用[Gram-Schmidt 程序](./Gram-Schmidt%20%E7%A8%8B%E5%BA%8F.md)从 $\begin{pmatrix}\boldsymbol{a}_{k}\end{pmatrix}$ 生成的**标准**正交的向量组
- $R$
  - $\hat{x}_{j,i}=\displaystyle\frac{\boldsymbol{a}_{i}^{T}\boldsymbol{a}_{j}}{\boldsymbol{a}_{i}^{T}\boldsymbol{a}_{i}}$

> [!NOTE] R 的性质
>
> 1.  是**方阵** ($A$ 和 $Q$ 可以不是方阵)
> 2.  是**上三角矩阵**
