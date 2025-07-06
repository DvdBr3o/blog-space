---
title: Laplace 变换
date: 2025-03-07T12:21:21+08:00
lastmod: 2025-05-14T12:49:43+08:00
tags:
  - 高等数学
  - 微分
  - 微分方程
  - 拉氏变换
categories: 高等数学
publish: true
---

[【知乎】 公式墙(1)——Laplace Transform(拉普拉斯变换)](https://zhuanlan.zhihu.com/p/152647974)

[【知乎】 常微分方程学习笔记（6）- 拉普拉斯变换 The Laplace Transform（上）](https://zhuanlan.zhihu.com/p/681423720)

[【知乎】 常微分方程学习笔记（7）- 拉普拉斯变换 The Laplace Transform（下）](https://zhuanlan.zhihu.com/p/681706788)

[【知乎】 【积分变换】利用拉普拉斯(Laplace)变换求解微分方程](https://zhuanlan.zhihu.com/p/579561439)

## 定义

$$
\mathrm{L} \left[ f(t) \right] = \int_{0}^{\infty} f(t)\cdot e^{-st} \, dt 
$$
其中 $s \in \mathbb{C}$

所以 RHS 构成一个关于 $s \in \mathbb{C}$ 的函数 $F(s)$

>[!note] 拉普拉斯变换表
> 1. $L(1)=\frac{1}{s}$
> 2. $L(e^{a t})=\frac{1}{s-a}$
> 3. $L(\ln t)=- \frac{\gamma + \ln s}{s}$
> 4. $L(t^{n})=\frac{\Gamma(n+1)}{s^{n+1}}$
> 	🔗[Gamma函数 & B函数](../%E5%B9%BF%E4%B9%89%E7%A7%AF%E5%88%86/Gamma%E5%87%BD%E6%95%B0%20&%20B%E5%87%BD%E6%95%B0.md)
> 4. $L(t^{n}e^{at})=\frac{\Gamma(n+1)}{(s-a)^{n+1}}$
> 5. $L(\sin at)=\frac{a}{s^{2}+a^{2}}$
> 6. $L(\cos at)=\frac{s}{s^{2}+a^{2}}$
> 7. $L(\sinh t)=\frac{a}{s^{2}-a^{2}}$
> 8. $L(\cosh t)=\frac{s}{s^{2}-a^{2}}$
> 9. $L(t\sin at)=\frac{2as}{(s^{2}+a^{2})^{2}}$
> 10. $L(t\cos at)=\frac{s^{2}-a^{2}}{(s^{2}+a^{2})^{2}}$
> 11. $L[\frac{1}{2a^{3}}(\sin at-at\cos at)]=\frac{1}{(s^{2}+a^{2})^{2}}$

## 性质

1. **【线性】** 
	1. $L\left[ k \cdot f(t) \right]=k\cdot L\left[ f(t) \right]$
	2. $L\left[ f(t) + g(t) \right] = L\left[ f(t) \right]+L\left[ g(t) \right]$

2. **【微分】** $$L\left[ f^{(n)}(x) \right] =s ^{n}L\left[ f(t) \right]+ \sum_{i=0}^{n-1} s ^{i}f^{(n-1-i)}(0) $$


3. **【积分】** $$L\left[ \left( \int_{0}^{t} dt \right)^{n} f(t) \right] = s^{-n} L\left[ f(t) \right]  $$

4. **【相似性】** $$L\left[ f(at) \right] = \frac{1}{a}L\left[ f\left( \frac{t}{a} \right) \right] $$
5. **【像积分】** $$L\left[ \frac{f(t)}{t} \right] = \int_{s}^{\infty} L\left[ f(t) \right]  \, \mathrm{d}t $$
6. **【初值/终值】** $$\lim_{ t \to +\infty } f(t)=\lim_{ s \to 0^{+} } sF(s)$$ $$\lim_{ t \to 0^{+} } f(t)=\lim_{ s \to +\infty } sF(s)$$
7. **【卷积】**
	$$L\left[ f(t) * g(t) \right] = L\left[ f(t) \right] \cdot L\left[ g(t) \right] $$

>[!note] 卷积
>$$f(t) * g(t) = \int_{-\infty}^{+\infty} f(\tau)g(t-\tau) \, \mathrm{d}\tau $$
>
>在信号系统中当 $t<0$ 或者 $t>t_{current}$ 时 $f(t)=g(t)=0$ 所以
>
>$$f(t) * g(t) = \int_{0}^{t} f(\tau)g(t-\tau) \, \mathrm{d}\tau $$

8. **【位移】**
	若 $F(s) = L\left[ f(t) \right]$ 则 $$L\left[ e^{at}f(t) \right]=F(s-a) $$

## 逆变换

### 定义法

若 $s=\beta+i\omega$ 则
$$
f(t)= \frac{1}{2\pi i} \int_{\beta-i\infty}^{\beta+i\infty} F(s)e^{st}  \, \mathrm{d}s 
$$

### 查表法

对着表逆推回去即可。