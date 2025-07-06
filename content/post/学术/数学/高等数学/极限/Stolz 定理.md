---
title: Stolz 定理
date: 2025-04-14T23:31:30+08:00
lastmod: 2025-05-09T12:57:36+08:00
tags:
  - 高等数学
  - 极限
categories: 高等数学
publish: true
---

## 0/0 型

已知
- 无穷小量 $\left\{ a_{n} \right\}$ **严格单减**
- 无穷小量 $\left\{ b_{n} \right\}$
- $$\lim_{ n \to \infty } \frac{b_{n+1}-b_{n}}{a_{n+1}-a_{n}}=l$$ 其中 $l=\mathrm{const}$ 或者 $l=\pm \infty$
则
$$
\lim_{ n \to \infty } \frac{b_{n}}{a_{n}} = l
$$

## arb/inf 型

已知
- 无穷大量 $\left\{ a_{n} \right\}$ **严格单增**
- 任意数列 $\left\{ b_{n} \right\}$
- $$\lim_{ n \to \infty } \frac{b_{n+1}-b_{n}}{a_{n+1}-a_{n}}=l$$ 其中 $l=\mathrm{const}$ 或者 $l=\pm \infty$

---

>[!note] 记忆方式
>Stolz 定理可以理解为离散形式的 $\frac{0}{0}$ / $\frac{\infty}{\infty}$ 型洛必达法则
>
>即在 $\frac{0}{0}$ / $\frac{\infty}{\infty}$ 时 $$\lim_{ n \to \infty } \frac{a_{n}}{b_{n}}=\lim_{ n \to \infty } \frac{\Delta a_{{n}}}{\Delta b_{n}}$$
