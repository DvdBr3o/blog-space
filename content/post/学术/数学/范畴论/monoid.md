---
title: monoid
date: 2026-11-17T17:00:34+08:00
lastmod: 2026-11-18T21:48:27+08:00
tags:
  - 范畴论
publish: true
---
## 定义

$(M,\otimes,e)$ 是 monoid $\iff$
1. $M$ 为基集
2. $\otimes$ 为满足**结合律**的二元运算符 $$(a\otimes b)\otimes c=a\otimes (b\otimes c) \ \forall a,b,c\in M$$
3. $e$ 为幺元 $$e\otimes x=x \ \forall x \in M$$
>[!example] monoid 例子
>1. $(\mathbb{Z},+,0)$
>2. $(\mathbb{Z},\times,1)$
>3. $(\text{vector},\text{concat}, \text{empty\_vector})$

## 性质

- 【笛卡尔积】$A,B$ 都是 monoid $\implies$ $A\times B$ 也是 monoid