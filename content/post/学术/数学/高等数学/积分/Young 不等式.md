---
title: Young 不等式
date: 2025-04-28T22:06:44+08:00
lastmod: 2025-05-04T23:26:28+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
  - 反函数
category: 高等数学
publish: true
---

已知
- $f(x)$ 在 $[0,+\infty)$
	- 连续可导
	- 严格单增
- $g(x)$ 是 $f(x)$ 反函数
则
$$
ab\le \int_{0}^{a} f(x) \, \mathrm{d}x +\int_{0}^{b} g(y) \, \mathrm{d}y 
$$

>[!hint] 几何证明
>![数学分析习题课讲义(第2版)(上册) (谢惠民, 恽自_ (Z-Library), p.366](../%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90%E4%B9%A0%E9%A2%98%E8%AF%BE%E8%AE%B2%E4%B9%89(%E7%AC%AC2%E7%89%88)(%E4%B8%8A%E5%86%8C)%20(%E8%B0%A2%E6%83%A0%E6%B0%91,%20%E6%81%BD%E8%87%AA_%20(Z-Library).pdf.md#page366andrect57446363597andcolornote)

>[!hint] 解析证明
> 
> $$
> \begin{align}
> I & =\int_{0}^{a} f(x) \, \mathrm{d}x +\int_{0}^{g(b)} x \, \mathrm{d}f(x) \\
>  & =\int_{0}^{a} f(x) \, \mathrm{d}x + xf(x)\bigg|_{0}^{g(b)}-\int_{0}^{g(b)} f(x) \, \mathrm{d}x  \\
>  & =\int_{g(b)}^{a} f(x) \, \mathrm{d}x + bg(b) \\
>  & \ge \mathrm{max}f(x) \int_{g(b)}^{a}  \, \mathrm{d}x +bg(b) \\
>  & = b(a-g(b))+bg(b) \\
>  & = ab
> \end{align}
> $$

