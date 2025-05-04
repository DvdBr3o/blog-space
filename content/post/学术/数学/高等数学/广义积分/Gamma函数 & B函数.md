---
title: Gamma函数 & B函数
date: 2025-03-13T09:22:11+08:00
lastmod: 2025-04-28T10:23:59+08:00
tags:
  - 积分
  - 高等数学
categories: 高等数学
publish: true
---

## Gamma 函数

### 定义

$$
	\Gamma(\alpha)=\int_{0}^{+\infty} x^{\alpha-1} e^{-x} \, dx 
$$

>[!info] 变种形式
>1. $\Gamma(\alpha)=\int_{0}^{+\infty} x^{2\alpha-1}e^{-x^{2}} \, \mathrm{d}x$

### 性质

- $\Gamma(\alpha+1)=\alpha\Gamma(\alpha)$
- $\Gamma(n)=(n-1)!$ when $n\in N_+$
- $\Gamma(1)=1$
- $\Gamma(1/2)=\sqrt{ \pi }$
- 【加倍公式】$\Gamma(2x)=2^{2x-1} \frac{\Gamma(x)\Gamma\left( x+\frac{1}{2} \right)}{\Gamma\left( \frac{1}{2} \right)}$
- 【余元公式】在 $0<x<1$ 上 $$\Gamma(x)\Gamma(1-x)=\frac{\pi}{\sin \pi x}$$

## B函数

### 定义

$$
B(p,q) = \int_{0}^{1} x^{p-1}(1-x)^{q-1} \, dx 
$$

>[!info] 变种形式
>1. 令 $x=\cos^{2}\theta$
>	- $B(p,q)=2\int_{0}^{\pi/2} \cos ^{2p-1}\theta \sin ^{2q-1}\theta \, \mathrm{d}\theta$
>	- $\int_{0}^{\pi/2} \cos ^{m}x\sin ^{n}x \, \mathrm{d}x=\frac{1}{2}B\left(\frac{m+1}{2},\frac{n+1}{2}\right)$
>1. 令 $x=\frac{y}{1+y}$ 和 $x=\frac{1}{1+y}$
>	- $B(p,q)=\int_{0}^{+\infty} \frac{y^{p-1}}{(1+y)^{p+q}} \, \mathrm{d}y$
>	- $B(p,q)=\int_{0}^{+\infty} \frac{y^{q-1}}{(1+y)^{p+q}} \, \mathrm{d}y$
>	- $B(p,q)=\frac{1}{2}\int_{0}^{+\infty} \frac{y^{p-1}+y^{q-1}}{(1+y)^{p+q}} \, \mathrm{d}y$

### 性质

- $B(p,q)=B(q,p)$
- $B(p,q)=\frac{\Gamma(p) \cdot \Gamma(q)}{\Gamma(p+q)}$
	- $B(m,n)=\frac{(m-1)!(n-1)!}{(m+n-1)!}$ when $m,n\in N_+$
	- $B(\frac{1}{2},\frac{1}{2})=\pi$


