---
title: LU分解
date: 2025-03-25T09:05:06+08:00
lastmod: 2025-06-29T23:24:43+08:00
tags:
  - 线性代数
  - 矩阵
categories: 线性代数
publish: true
---

## 定义

$$
A=LU
$$

其中
- $L$ 为下三角 (Lower) 矩阵
- $U$ 为上三角 (Upper) 矩阵

## 求分解

先写好可以确定的矩阵部分
$$
A=\begin{bmatrix}
1 & 0 & \dots & 0 \\
 & 1 & \dots & 0\\
 &  & \ddots & \vdots \\
 &  &  & 1
\end{bmatrix}
\begin{bmatrix}
U_{11} &  \\
0 & U_{22} \\
0 & 0 & \ddots \\
0 & 0 & \dots & U_{nn}
\end{bmatrix}
$$
然后对 $A$ 的每个 $A_{ij}$ 对应在矩阵相乘构成一个方程
保证每个方程是一元一次方程可以解开 $L$ 或 $U$ 中一个位置的空白

### LDU 分解

对于已求的 $LU$ 分解
$$
U=DU'
$$
其中
- $D$ $\to$ 对角矩阵
	- $D_{ii}=U_{ii}$
	- $D_{\mathrm{else}}=0$
- $U'$ $\to$ 标准上三角矩阵
	- $U'_{ii}=1$
	- $U'_{\mathrm{else}}=U_{\mathrm{else}}$

于是
$$
A=LU=LDU'
$$
