---
title: Y Combinator
date: 2026-05-06T20:46:20+08:00
lastmod: 2026-05-06T20:54:37+08:00
tags:
  - 编译
  - 函数式
publish: true
---

## 定义

Y Combinator (Y 组合子) :=
$$
Y(f)=f(Y(f))
$$

## 实现

$$
Y = f \to (x \to f(x(x)))(x\to f(x(x)))
$$

