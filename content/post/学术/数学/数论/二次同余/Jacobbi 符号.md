---
title: Jacobbi 符号
date: 2025-11-03T20:40:25+08:00
lastmod: 2025-12-08T17:36:44+08:00
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

1. 【**分母可分**】$a$ 为**奇数** $$\left(\frac{a}{mn}\right)=\left(\frac{a}{m}\right)\left(\frac{a}{n}\right)$$

2. 【**剩余最简**】$$\left(\frac{a}{m}\right)=\left(\frac{a \ \mathrm{mod}\ m}{m}\right)=\left(\frac{a+km}{m}\right)$$

3. 【**分子可分**】$$\left(\frac{ab}{m}\right)=\left(\frac{a}{m}\right)\left(\frac{b}{m}\right)$$

4. 【**二次剩余**】若 $(a,m)=1$ 则 $$\left(\frac{a^{2}}{m}\right)=1$$

5. 【神人1】$$\left(\frac{1}{m}\right)=1$$

6. 【神人-1】$$\left( \frac{-1}{m} \right)=(-1)^{\frac{m-1}{2}}=\left\{ \begin{align} & 1 & m\equiv 1 \ \mathrm{mod}\,4 \\  & -1 & m\equiv 3 \ \mathrm{mod}\,4 \end{align}  \right. $$

7. 【神人 2】$$\left( \frac{2}{m} \right)=(-1)^{\frac{m^{2}-1}{8}}=\left\{ \begin{align} & 1 & m\equiv \pm 1 \ \mathrm{mod}\,8 \\  & -1 & m\equiv \pm3 \ \mathrm{mod}\,8 \end{align}  \right. $$

8. 【互反律】已知 $m,n$
	- 都是奇素数乘积
	- $(m,n)=1$

	则 $$\left(\frac{n}{m}\right)=(-1)^{\frac{m-1}{2}\cdot\frac{n-1}{2}}\left(\frac{m}{n}\right)$$