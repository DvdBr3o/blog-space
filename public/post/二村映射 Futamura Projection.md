---
title: 二村映射 Futamura Projection
date: 2026-05-05T15:14:08+08:00
lastmod: 2026-05-06T22:41:50+08:00
tags:
  - 编译
  - 二村映射
  - futamura_projection
publish: true
---

[https://dl.acm.org/doi/10.1145/1480945.1480954](https://dl.acm.org/doi/10.1145/1480945.1480954)

## 定义

### 核心概念

1. 论域
	1. 编程语言全集 $P_{L}$
	2. 数据全集 $D$
	3. 语义函数 $[_](_.md)_{L}:P_{L}\to(D\to D)$
		1. $[p](p.md)_{L} : D\to D$ 为 $L$ 语言下的语义为 $p$ 的程序 

2. 程序等效 $:=$ $p,q$ 程序等效 $\Leftrightarrow$ $\forall d\in D, \ [p](p.md)_{L} \, d= [q](q.md)_{L} \, d$

3. interpreter 解释器 $\mathrm{int} := \forall p \in P_{L} \  \forall d\in D$ $$[ mathrm{int} ](mathrm%7Bint%7D.md)_{L}(p, d)=[p](p.md)_{N}(d)$$ 

4. compiler 编译器 $\mathrm{comp}:= \forall p \in P_{L} \  \forall d\in D$ $$[mathrm{comp}](mathrm%7Bcomp%7D.md)_{L}p]]_{L}d=[p](p.md)_{N}d$$
5. specializer 特化器 $s := \forall p \in P_{L} \  \forall x,y\in D$ $$[ , s](,%20s.md)_{L} (p, x) \,]]_{L} (y) = [p](p.md)_{L}(x, y)$$ aka. partial evaluator

6. compiler generator 圣杯 $\mathrm{cog} := \forall p \in P_{L} \  \forall x,y\in D$ $$[,,mathrm{cog}](,,mathrm%7Bcog%7D.md)_{L} \,p]]_{L} \,x]]_{L} \,y = [p](p.md)_{L}(x, y)$$

### 二村映射


| 映射     | 映射过程                      | 压缩结果                               |
| ------ | ------------------------- | ---------------------------------- |
|        | $[p](p.md)(x,y)=\mathrm{out}$ |                                    |
| 第一二村映射 | $[s](s.md)(p,x)=\mathrm{res}$ | $[res](res.md)(y)=\mathrm{out}$          |
| 第二二村映射 | $[s](s.md)(s,p)=\mathrm{gen}$ | $[mathrm{gen}](mathrm%7Bgen%7D.md)(p)=\mathrm{res}$ |
| 第三二村映射 | $[s](s.md)(s,s)=\mathrm{cog}$ | $[mathrm{cog}](mathrm%7Bcog%7D.md)(s)=\mathrm{gen}$ |
