---
title: Jacobbi 符号
date: 2025-11-03T20:40:25+08:00
lastmod: 2025-11-09T17:03:04+08:00
tags:
  - 数论
  - 同余
categories: 数论
publish: true
---

## 定义

已知
- $\left\{p_{i}\dots\right\}$ 都是**奇**素数
- $m=\prod p_{i}$
则

$$
\left(\frac{a}{m}\right) := \prod\left(\frac{a}{p_{i}}\right)
$$

## 性质

0. 【互质】若 $(a,m)\neq 1$ 则 $\left( \frac{a}{m} \right)=0$
1. 【剩余最简】$$\left(\frac{a+km}{m}\right)=\left(\frac{a}{m}\right)$$

2. 【分子可分】$$\left(\frac{ab}{m}\right)=\left(\frac{a}{m}\right)\left(\frac{b}{m}\right)$$

3. 【二次剩余】若 $(a,m)=1$ 则 $$\left(\frac{a^{2}}{m}\right)=1$$

4. 【神人1】$$\left(\frac{1}{m}\right)=1$$
5. 【神人-1】$$\left( \frac{-1}{m} \right)=(-1)^{\frac{m-1}{2}}=\left\{ \begin{align} & 1 & p\equiv 1 \ \mathrm{mod}\,4 \\  & -1 & p\equiv 3 \ \mathrm{mod}\,4 \end{align}  \right. $$
6. 【神人 2】$$\left( \frac{2}{m} \right)=(-1)^{\frac{m-1}{2}}=\left\{ \begin{align} & 1 & p\equiv \pm 1 \ \mathrm{mod}\,8 \\  & -1 & p\equiv \pm3 \ \mathrm{mod}\,8 \end{align}  \right. $$

7. 【互反律】已知 $m,n$
	- 都是奇素数乘积
	- $(m,n)=1$

	则 $$\left(\frac{n}{m}\right)=(-1)^{\frac{m-1}{2}\cdot\frac{n-1}{2}}\left(\frac{m}{n}\right)$$