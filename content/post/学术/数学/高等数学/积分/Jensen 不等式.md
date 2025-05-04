---
title: Jensen 不等式
date: 2025-04-17T18:37:41+08:00
lastmod: 2025-05-04T23:27:01+08:00
tags:
  - 高等数学
  - 积分
  - 不等式
  - 放缩
  - 凸性
categories: 高等数学
publish: true
---

已知
- $f(x)$ 有界
- $p(x)$ 满足 $\int_{a}^{b} p(x) \, \mathrm{d}x>0$
- $\varphi(x)$ 在 $f(x)$ 值域下凸
则
$$
\varphi\left( \frac{\int_{a}^{b} p(x)f(x) \, \mathrm{d}x }{\int_{a}^{b} p(x) \, \mathrm{d}x } \right) \le \frac{\int_{a}^{b} p(x)\varphi(f(x)) \, \mathrm{d}x }{\int_{a}^{b} p(x) \, \mathrm{d}x }
$$

($\varphi$ 上凸则反向)

>[!note] 具体形式
>1. $\exp \int_{a}^{b} p(x)\ln f(x) \, \mathrm{d}x \le \int_{a}^{b} p(x)f(x) \, \mathrm{d}x \le \ln \int_{a}^{b} p(x)\exp f(x) \, \mathrm{d}x$
>2. $\int_{0}^{1} f(x^{n}) \, \mathrm{d}x\le f(\frac{1}{1+n})$

>[!hint] 证明
>**整体思路**：泰勒展开，根据凸性放缩掉 $f''$ 项
