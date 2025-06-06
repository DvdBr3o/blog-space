---
title: Opial 不等式
date: 2025-05-02T23:02:50+08:00
lastmod: 2025-05-14T12:51:10+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
category: 高等数学
publish: true
---

## 线性单端零点

已知
- $f(a)=0$
则
$$
\int_{a}^{b} \left|f(x)f'(x)\right| \, \mathrm{d}x \le \frac{b-a}{2}\int_{a}^{b} \left[f'(x)\right]^{2} \, \mathrm{d}x  
$$

>[!hint] 证明
> **核心构造函数** $h(x)=\int_{a}^{x} \left|f'(t)\right| \, \mathrm{d}t$
> 则
> - $h(x)\ge\left|\int_{a}^{x} f'(t) \, \mathrm{d}t\right|=f(x)$
> - $h'(x)=\left|f'(x)\right|$
> 
> 则
> $$
> \begin{align}
> \mathrm{LHS}  & \le \int_{a}^{b} h(x)h'(x) \, \mathrm{d}x \\
>   & = \frac{1}{2}[h(x)]^{2}\bigg|_{a}^{b} \\
>  & =\frac{1}{2}[h(b)]^{2} \\
>  & =\frac{1}{2}\left[\int_{a}^{b} h'(x) \, \mathrm{d}x \right]^{2} \\
>  & \le \frac{1}{2}\int_{a}^{b} 1 \, \mathrm{d}x \int_{a}^{b} [h'(x)]^{2} \, \mathrm{d}x  & (Cachy-Schwarz) \\
>  & = \frac{b-a}{2} \int_{a}^{b} [f'(x)]^{2} \, \mathrm{d}x  
> \end{align}
> $$

## 线性双端零点

已知
- $f(a)=f(b)=0$

则
$$
\int_{a}^{b} \left|f \cdot f'\right| \, \mathrm{d}x \le \frac{b-a}{4} \int_{a}^{b} \left[f'\right]^{2} \, \mathrm{d}x  
$$

>[!hint] 证明
>1. 对 $[a,\frac{a+b}{2}]$ 和 $-[\frac{a+b}{2}, b]$ 使用 [线性单端零点](Opial%20%E4%B8%8D%E7%AD%89%E5%BC%8F.md#) 结论
>2. 将两个不等式相加得证

## Beesack Opial 拓展

