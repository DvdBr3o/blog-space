---
title: Poisson 积分
date: 2025-05-09T22:54:38+08:00
lastmod: 2025-05-09T23:16:09+08:00
tags:
  - 高等数学
  - 积分
  - 广义积分
category: 高等数学
publish: true
---

$$
I(r)=\int_{0}^{\pi} \ln (1\pm2r\cos\theta+r^{2}) \, \mathrm{d}\theta =\left\{ \begin{align}
 & 0, & \left| r \right| < 1 \\
 & 2\pi \ln \left| r \right| , & \left| r \right| > 1
\end{align} \right. 
$$

>[!hint] 证明思路 | 递推法
>
>1. 证明 $I(r)=I(-r)$
>2. 证明 $I(r)=\frac{1}{2}I(r^{2})$
>3. 递推证明 $I(r)=\frac{1}{2^{n}}I(r^{2^{n}})$
>4. 求值
>	1. $\left| r \right|<1$ 时 
>		- $r^{2^{n}}\to 0$
>		- $I(r^{2^{n}})\to I(0)=0$
>		- $I(r)=0$
>	2. $\left| r \right| >1$ 时
>		- $I(r)=I\left( \frac{1}{r} \right)+\int_{0}^{\pi} \ln r^{2} \, \mathrm{d}\theta=0+2\pi \ln \left| r \right|$

>[!hint] 证明思路 | 一致收敛法
>1. 糊弄证明一致收敛
>2. 求 $\frac{ \partial }{ \partial r }I(r)$
>3. 积回来


