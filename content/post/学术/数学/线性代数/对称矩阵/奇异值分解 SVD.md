---
title: 奇异值分解 SVD
date: 2025-12-05T22:11:05+08:00
lastmod: 2025-12-12T14:04:20+08:00
tags:
  - 线性代数
  - 对称
  - 矩阵
  - 奇异值
categories: 线性代数
publish: true
---

## 奇异值

已知 $A\in \mathbb{R}^{m\times n}$

则
1. $A^{T}A$ 对称，特征值 $\lambda_{{i}}$ 恒正 (默认 $\lambda_{1}\geq\lambda_{2}\geq\dots\geq\lambda_{n}$)
2. 特征值 $\sigma_{i}=\sqrt{ \lambda_{i} }$

## 奇异值分解

已知
- $A\in \mathbb{R}^{m\times n}$ 
- $\mathrm{rank}A=r$

则存在
- $U\in \mathbb{R}^{m\times m}$ 为正交矩阵
- $V\in \mathbb{R}^{n\times n}$ 为正交矩阵
- $\sum=\begin{bmatrix}D_{\sigma} & 0 \\ 0 & 0^{(m-r)\times(n-r)}\end{bmatrix}\in \mathbb{R}^{m\times n}$
- $A=U\sum V^{T}$

>[!warning]
>注意用的都是 $\sigma=\sqrt{ \lambda }$ 而不是 $\lambda$！

求解:
1. 计算 $A^{T}A$
2. 【构建 $V$】降序排列 $A^{T}A$ 的特征向量+**标准化**得到 $V=\begin{bmatrix}v_{1}\dots v_{n}\end{bmatrix}$
3. 【构建 $\sum$】求对角化 $A^{T}A$ 得到 $\lambda_{i}$ 以及 $\sigma_{i}=\sqrt{ \lambda_{i} }$，并降序排序，得到 $\sum$
4. 【构建 $U$】**标准化** $U=\begin{bmatrix}u_{1}\dots u_{m}\end{bmatrix}$ where
	1. $\sigma_{i} \neq 0$ 则 $u_{i}=\frac{1}{\sigma_{i}}A\boldsymbol{v}_{i}$
	2. $\sigma_{i}=0$ 则用已知 $U=\begin{bmatrix}u_{i}\dots\end{bmatrix}$ 解 $U^{T}\boldsymbol{x}=\boldsymbol{0}$ 并用[Gram-Schmidt 程序](../%E6%AD%A3%E4%BA%A4/Gram-Schmidt%20%E7%A8%8B%E5%BA%8F.md)解标准正交基
