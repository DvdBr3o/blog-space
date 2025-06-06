---
title: Bellman-Gronwall 不等式
date: 2025-05-03T15:58:08+08:00
lastmod: 2025-05-14T12:51:16+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
category: 高等数学
publish: true
---

已知
- $f(x)$ 和 $g(x)$ 在 $[a,b)$ 非负连续
- $$f(x)\le A(x)+\int_{a}^{x} f(t)g(t) \, \mathrm{d}t $$

则
$$
f(x) \le A(x) + \int_{a}^{x} g(t)A(t)\exp\left(\int_{t}^{x} g(r) \, \mathrm{d}r \right) \, \mathrm{d}t 
$$

>[!note] 记忆
>两端对 $x$ 求导，解微分方程得 $f(t)=A(t)\exp\left(\int_{t}^{x} g(r) \, \mathrm{d}r\right)$ 代入原不等式得证

>[!hint] 证明
> 
> **核心构造函数** $v(t)=\exp\left(-\int_{a}^{t} g(r) \, \mathrm{d}r\right)\int_{a}^{t} f(r)g(r) \, \mathrm{d}r$
> 
> 则
> $$
> \begin{align}
> v'(t) & =\left(f(t)-\int_{a}^{t} f(r)g(r) \, \mathrm{d}r \right)g(t)\exp\left(-\int_{a}^{t} g(r) \, \mathrm{d}r \right) \\
>  & \le A(t)g(t)\exp\left(-\int_{a}^{t} g(r) \, \mathrm{d}r \right)
> \end{align}
> $$
> 两边对 $[a,x]$ 求定积分，根据 $v(a)=0$ 得
> $$
> \begin{align}
> v(x)  & \le \int_{a}^{x} A(t)g(t)\exp\left(-\int_{a}^{t} g(r) \, \mathrm{d}r \right) \, \mathrm{d}t  \\
> \int_{a}^{x} f(t)g(t) \, \mathrm{d}t & \le \int_{a}^{x} A(t)g(t)\exp\left(\int_{a}^{x} g(r) \, \mathrm{d}r - \int_{a}^{t} g(r) \, \mathrm{d}r  \right) \, \mathrm{d}t \\
> \int_{a}^{x} f(t)g(t) \, \mathrm{d}t & \le \int_{a}^{x} A(t)g(t) \exp\left(\int_{t}^{x} g(r) \, \mathrm{d}r \right) \, \mathrm{d}t  
> \end{align}
> $$
> 从而轻易有
> $$
> f(x) \le A(x) + \int_{a}^{x} f(t)g(t) \, \mathrm{d}x \le A(x) + \int_{a}^{x} A(t)g(t)\exp\left(\int_{t}^{x} g(r) \, \mathrm{d}r \right) \, \mathrm{d}t  
> $$
