---
title: Gauss 公式
date: 2025-01-30T19:40:38+08:00
lastmod: 2025-05-11T16:38:53+08:00
tags:
  - 高等数学
  - 多元
  - 积分
categories: 高等数学
publish: true
---

## 已知

- 曲面 $S$
	- 封闭
	- **无奇点**
- 空间 $\Omega$ 的边界是 $S$

## 结论

### 朴素形式
$$
{\subset\!\supset} \mathllap{\iint}_{S} P\,dy\,dz+Q\,dz\,dx+R\,dx\,dy = \iiint_{\Omega}\left( \frac{\partial P}{\partial x} + \frac{\partial Q}{\partial y} + \frac{\partial R}{\partial z} \right) \,dV
$$

### 散度形式

$$
{\subset\!\supset} \mathllap{\iint}_{S}\vec{F}\,d\vec{S}=\iiint_{\Omega} \mathrm{div}\,\vec{F}\,dV
$$

## 证明

任选一维，以 $z$/$R$ 方向为例

对于该维，将闭合曲面分割成形如下图的形式，由此定义出 $S$，$S_{1}$，$S_{2}$，$S_{3}$，$D$

![高等数学 北大版 第三版 下册 (李忠 周建莹) (Z-Library), p.147](../%E9%AB%98%E6%95%B0%E4%B8%8B/%E9%AB%98%E7%AD%89%E6%95%B0%E5%AD%A6%20%E5%8C%97%E5%A4%A7%E7%89%88%20%E7%AC%AC%E4%B8%89%E7%89%88%20%E4%B8%8B%E5%86%8C%20(%E6%9D%8E%E5%BF%A0%20%E5%91%A8%E5%BB%BA%E8%8E%B9)%20(Z-Library).pdf.md#page147andrect240358385520andcolornote)

于是
$$
\begin{align}
{\subset\!\supset} \mathllap{\iint}_{S}R\,dx\,dy & =\iint_{S_{1}+S_{2}+S_{3}}R\,dx\,dy \\
 & =\iint_{S_{1}}R\,dx\,dy+\iint_{S_{2}}R\,dx\,dy+\iint_{S_{3}}R\,dx\,dy \\
 & =\iint_{D}\left( R_{S_{1}}-R_{S_{2}} \right)\,dx\,dy + 0\\
 & =\iint_{D}dR\,dx\,dy \\
 & = \int dx\,dy\, \int_{S_{2}}^{S_{1}} \frac{\partial R}{\partial z} \, dz \\
 & =\iint_{D} \frac{\partial R}{\partial z}\,dV
\end{align}
$$
其他两维同理，三维相加即为**高斯公式**
