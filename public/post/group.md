---
title: group
date: 2026-11-23T08:31:00+08:00
lastmod: 2026-11-24T17:17:21+08:00
tags:
  - 范畴论
  - 抽象代数
publish: true
---

## 定义

$(G,\bullet)$ 是 group :=
- 【结合】$\forall g,h,k\in G\to(g\bullet h)\bullet k=g\bullet(h \bullet k)$
- 【幺元】$\exists e_{G}\in G \, \forall g\in G\to e_{G}\bullet g=g=g\bullet e_{G}$
- 【可逆】$\forall g\in G\, \exists g^{-1}\in G\to g\bullet g^{-1}=e_{G}=g^{-1}\bullet g$

>[!note] group 大家族
>- 幺半群 [monoid](./monoid.md) := group - 可逆
>- 半群 semigroup := group - 可逆 - 幺元
>- 交换群 commutative group = abelian group := 交换律 + group
>- 对称群 symmetric group := 
>- 置换群 permutation group :=

### 序

群内对象 $g\in G$ 的序 $\lvert g \rvert$ $:=$ $\min_{n}\left\{n\mid g^{n}=e_{G}\right\}$
- $\lvert g \rvert=\infty \iff \neg\exists n(g^{n}=e_{G})$
- $g$ 是 devisor of n $:=$ $\lvert g \rvert=n$

### 群范畴




## 性质

-  $\lvert g \rvert \neq \infty$
	- $\implies$ $\forall m(\lvert g^{m} \rvert\neq \infty)$
	- $\implies$ $\lvert g^{m} \rvert=\frac{\operatorname{lcm}(m,\lvert g \rvert)}{m}=\frac{\lvert g \rvert}{\gcd(m,\lvert g \rvert)}$
