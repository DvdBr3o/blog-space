---
title: Fourier 级数
date: 2025-04-18T15:50:45+08:00
lastmod: 2025-05-07T11:43:39+08:00
tags:
  - 高等数学
  - 无穷级数
  - fourier
categories: 高等数学
publish: true
---

## 定义

### 周期函数

若 $f(x)$ 是周期为 $2l$ 的周期函数
则
$$
f(x)=\frac{a_{0}}{2}+\sum_{n=1}^{\infty}\left(a_{n}\cos \frac{\pi}{l}nx + b_{n}\sin \frac{\pi}{l}nx\right) 
$$
其中傅里叶系数
$$
\left\{
\begin{align}
a_{n} & =\frac{1}{l}\int_{-l}^{l} f(x)\cos \frac{\pi}{l}nx \, \mathrm{d}x \\
b_{n} & =\frac{1}{l}\int_{-l}^{l} f(x)\sin \frac{\pi}{l}nx \, \mathrm{d}x 
\end{align}
\right.
$$

>[!hint] Fourier 系数の证明
>分别左右同乘 $\cos x$  和 $\sin x$，根据[三角函数系 > 正交性](../../../../../../%E4%B8%89%E8%A7%92%E5%87%BD%E6%95%B0%E7%B3%BB.md#)化简得到余弦项系数和正弦项系数
>

>[!hint] Fourier 系数の计算
>1. 由于傅里叶系数の被积函数一定有 $\sin nx$ 和 $\cos nx$
>	而三角函数在**分部积分**中可积可导
>	所以只要 $f(x)$ 是**可导尽**
>	就可以用[表格法](../%E7%A7%AF%E5%88%86/%E8%A1%A8%E6%A0%BC%E6%B3%95.md)快速求解
>
>2. 奇偶函数可以直接判定其中一类系数为 $0$

### 有穷区间函数

经过[延拓](Fourier%20%E7%BA%A7%E6%95%B0.md#)得到周期函数，再由[周期函数](Fourier%20%E7%BA%A7%E6%95%B0.md#)の傅里叶系数定义求展开


## 延拓

### 周期延拓

$$
F(x)=f(x-2kl)
$$
分段定义在每个 $2kl-l\leq x<2kl+l$

### 奇延拓

原函数 $f(x)$ 定义在 $[0,l]$
$$
F_{\mathrm{odd}}(x)=\left\{\begin{align}
 & f(x), & 0 < x \le l \\
 & 0, & x = 0 \\
 & -f(-x), & -l \le x < 0
\end{align}\right.
$$
其傅里叶级数一定为[三角级数 > 正弦级数](../../../../../../%E4%B8%89%E8%A7%92%E7%BA%A7%E6%95%B0.md#)

### 偶延拓

原函数 $f(x)$ 定义在 $[0,l]$
$$
F_{\mathrm{even}}(x)=\left\{\begin{align}
 & f(x), & 0 \le x \le l \\
 & f(-x),  & -l \le x < 0 
\end{align}\right.
$$
其傅里叶级数一定为[三角级数 > 余弦级数](../../../../../../%E4%B8%89%E8%A7%92%E7%BA%A7%E6%95%B0.md#)

### 半周期延拓

原函数 $f(x)$ 定义在 $[0,l]$ 上
$$
F(x) = f(x-kl)
$$
分段定义在每个 $kl \le x < (k+1)l$ 上

## 审敛

1. 【Dirichlet 定理】已知函数 $f(x)$
	- 周期 $2\pi$
	- 在区间 $[-\pi,\pi]$ 上满足 Dirichlet 条件 i.e.
		- 分段连续
		- 分段单调
	则$f(x)$ 在 $(-\infty,+\infty)$ 上**逐点收敛**到 $$S(x)=\left\{\begin{align} & f(x), & 连续点\\  & \frac{f(x+0)+f(x-0)}{2}, & 间断点\end{align}\right.$$
2. 已知函数 $f(x)$
	- 周期 $2\pi$
	- 在区间 $[-\pi,\pi]$ 上分段可微
	则 $f(x)$ 在 $(-\infty,+\infty)$ 上**逐点收敛**到 $$S(x)=\frac{f(x+0)+f(x-0)}{2}$$

>[!note] Dirichlet 定理 vs. 分段可微审敛
>
>Dirichlet 定理是更宽泛的审敛法
>
>原因是 **Dirichlet 条件比分段可微更弱**

### 和函数

和函数应由[审敛](Fourier%20%E7%BA%A7%E6%95%B0.md#)中的 Dirichlet 定理/分段可微审敛中的 $S(x)$ 求出
