---
title: Hensel 引理
date: 2025-11-09T15:51:08+08:00
lastmod: 2025-12-07T15:51:56+08:00
tags:
  - 数论
  - 同余
categories: 数论
publish: true
---

欲解 $f(x)\equiv0 \ \mathrm{mod}\,p^{k+1}$

已知
- $f(x_{k})\equiv0 \ \mathrm{mod} \, p^{k}$
- 令 $\lambda := \frac{f(x_{k})}{p^{k}}$

则

- 升阶解 $f(x)\equiv0 \ \mathrm{mod} \, p^{k+1}$ 具有形式 $$x_{k+1}\equiv x_{k}+t_{k}\cdot p^{k} \ \mathrm{mod}\,p^{k+1}$$

	其中 

	- $p \nmid f'(x_{k})$ $\implies$ 唯一解 $$t_{k} = \frac{-f(x_{k})}{p^{k}}\cdot(f'(x_{1})^{-1} \mathrm{mod} \, p) \ \mathrm{mod} \,p$$

	- $p \mid f'(x_{k})$
		- $p \nmid -\frac{f(x_{k})}{p^{k}}$ $\implies$ 无解
		- $p \mid -\frac{f(x_{k})}{p^{k}}$ $\implies$ $p$ 个解 $t_{k}=0,\dots,p-1$

>[!note] 以防你不知道
>$x^{-1}\ \mathrm{mod}\,p$ 表示 $x$ 在 $\mathrm{mod}\,p$ 意义下的逆元

>[!warning] 注意
>注意 $t_{k}$ 的定义式是等于，里面的取模都是算术运算**而非同余运算**
>比如对于 $x^{3}+5x^{2}+9\equiv 0 \ \mathrm{mod}\,3^{2}$ 有 $x_{1} \equiv 1 \ \mathrm{mod}\,3$
>
>那么 $$t_{1}=(-\frac{1^{3}+5\cdot1^{2}+9}{3}\cdot(3\cdot1^{2+10\cdot1 }\% 3)) \% 3$$
>
>得到 $t_{1}=1$
>而不能直接用 $t_{k}\cdot p_{k}=-f(x_{k})\cdot(f^{-1}(x_{1}) \% p)$
