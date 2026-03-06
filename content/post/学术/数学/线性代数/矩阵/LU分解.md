---
title: LU分解
date: 2025-03-25T09:05:06+08:00
lastmod: 2026-01-09T15:31:58+08:00
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

1. 不断 row reduction
2. row reduction 的当前列子列，首位归一，不断放入 $L$
3. 直到 row reduction 到上三角矩阵，即为 $U$
4. 非方阵的 $L$ 用单位矩阵 $I$ 补齐剩余列

>[!note] 非方阵情形
>1. $L$ 仍然是方阵
>2. $U$ 与 $A$ 形状一致

>[!example]
>
>已知 $$A=\begin{bmatrix}\boldsymbol{2} & 4 & 5 & -2 \\ \boldsymbol{-4} & -5 & -8 & 1 \\ \boldsymbol{2} & -5 & 1 & 8 \\ \boldsymbol{-6} & 0 & -3 & 1\end{bmatrix}$$
>
>3. $\sim \begin{bmatrix}2 & 4 & 5 & -2 \\ 0 & \boldsymbol{3} & 2 & -3\\ 0 & \boldsymbol{-9} & -4 & 10\\0 & \boldsymbol{12} & 12 & -5\end{bmatrix}$
>4. $\sim \begin{bmatrix}2 & 4 & 5 & -2\\0 & 3 & 2 & -3\\0 & 0 & \boldsymbol{2} & 1\\0 & 0 & \boldsymbol{4} & 7\end{bmatrix}$
>5. $\sim \begin{bmatrix}2 & 4 & 5 & -2\\0 & 3 & 2 & -3\\0 & 0 & 2 & 1\\0 & 0 & 0 & \boldsymbol{5}\end{bmatrix}=U$
>
>而对 row reduction 进行列归一化得:
>
>$$\begin{bmatrix}2 & 0 & 0 & 0\\-4 & 3 & 0 & 0\\2 & -9 & 2 & 0\\-6 & 12 & 4 & 5\end{bmatrix} \sim \begin{bmatrix}1 & 0 & 0 & 0\\-2 & 1 & 0 & 0\\1 & -3 & 1 & 0\\-3 & 4 & 2 & 1\end{bmatrix}=L$$
>
>故 $A=LU$ 得分解为 $$\begin{bmatrix}2 & 4 & 5 & -2 \\ -4 & -5 & -8 & 1 \\ 2 & -5 & 1 & 8 \\ -6 & 0 & -3 & 1\end{bmatrix}=\begin{bmatrix}1 & 0 & 0 & 0\\-2 & 1 & 0 & 0\\1 & -3 & 1 & 0\\-3 & 4 & 2 & 1\end{bmatrix}\begin{bmatrix}2 & 4 & 5 & -2\\0 & 3 & 2 & -3\\0 & 0 & 2 & 1\\0 & 0 & 0 & \boldsymbol{5}\end{bmatrix}$$

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
