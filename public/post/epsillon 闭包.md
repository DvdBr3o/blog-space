---
title: epsillon 闭包
date: 2025-07-05T12:08:07+08:00
lastmod: 2025-07-05T20:10:07+08:00
tags:
  - 编译原理
  - 自动机
categories: 编译原理
publish: true
---

## 定义

$\varepsilon-\mathrm{closure}\left\{ p \right\} :=$ 状态 $p$ 通过空边 $\varepsilon$ 能到达的所有状态

> [!example] 例子
>
> ```mermaid
> graph LR
>
> 1--->|a|2
> 2--->|a|3
> 1--->|ε|4
> 1--->|ε|5
> 2--->|ε|4
> 4--->|ε|6
> ```
>
> 则
>
> - $\varepsilon-\mathrm{clossure}\left\{ 1 \right\}=\left\{ 1,4,5,6 \right\}$
> - $\varepsilon-\mathrm{clossure}\left\{ 2 \right\}=\left\{ 2,4,6 \right\}$
> - $\varepsilon-\mathrm{clossure}\left\{ 4 \right\}=\left\{ 4,6 \right\}$
> - $\varepsilon-\mathrm{clossure}\left\{ 5 \right\}=\left\{ 5 \right\}$

## 性质

1. 交集换序 $$\varepsilon-\mathrm{clossure}\left\{ p_{1},p_{2} \right\} =\varepsilon-\mathrm{clossure}\left\{ p_{1} \right\} \cup \varepsilon-\mathrm{clossure}\left\{ p_{2} \right\} $$
