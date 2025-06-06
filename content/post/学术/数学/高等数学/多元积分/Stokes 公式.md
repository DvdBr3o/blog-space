---
title: Stokes 公式
date: 2025-02-08T14:07:02+08:00
lastmod: 2025-05-11T16:38:46+08:00
tags:
  - 高等数学
  - 多元
  - 积分
categories: 高等数学
publish: true
---

## 应用

- 空间
- 曲线
- 环积分

## 已知

- 曲面 $S$
	- **正向约定**
		法向量 $\vec{n}$ 与边界 $L$ 方向成**右手系**
	- $S+L$ 有一阶连续偏导
## 结论

### 朴素形式

$$
\oint_{L+}P\,dx+Q\,dy+R\,dz=\iint_{S+}\left( \frac{\partial R}{\partial y}-\frac{\partial Q}{\partial z} \right)\,\mathrm{d}x\mathrm{d}y+\left( \frac{\partial P}{\partial z}-\frac{\partial R}{\partial x} \right)\,\mathrm{d}y\mathrm{d}z+\left( \frac{\partial Q}{\partial x}-\frac{\partial P}{\partial y} \right)\mathrm{d}z\mathrm{d}x
$$

### 朴素行列式形式

$$
\oint_{L+}P\,dx+Q\,dy+R\,dz=\iint_{S+}\left| \begin{matrix}
dy\,dz& dx\,dz& dx\,dy \\
\frac{\partial}{\partial x}& \frac{\partial}{\partial y}& \frac{\partial}{\partial z} \\
P& Q& R
\end{matrix} \right| 
$$
### 旋度形式

由[朴素行列式形式](Stokes%20%E5%85%AC%E5%BC%8F.md#)可以引出**旋度** $\mathrm{rot}$

$$
\oint_{L+}\vec{F}\,d\vec{S} = \iint_{S+}\mathrm{rot}\,\vec{F}\cdot d\vec{S}
$$

其中

$$
\begin{align}
\mathrm{rot}\,\vec{F} & =\mathrm{rot}\,\left( P,Q,R \right)   \\
 & = \left| \begin{matrix}
\vec{i}& \vec{j}& \vec{k} \\
\frac{\partial}{\partial x}& \frac{\partial}{\partial y}& \frac{\partial}{\partial z} \\
P& Q& R
\end{matrix} \right| 
\end{align}
$$
$$
\begin{align}
d\vec{S} & =(\cos\alpha,\cos\beta,\cos\gamma)\cdot \mathrm{d}S \\
 & =(\mathrm{d}y\mathrm{d}z,\mathrm{d}z\mathrm{d}x,\mathrm{d}x\mathrm{d}y)
\end{align}
$$
### 旋度变式形式

$$
\oint_{L+}\vec{F}\,d\vec{S}=\left| \begin{matrix}
\cos\alpha & \cos\beta & \cos\gamma \\
\frac{\partial}{\partial x}& \frac{\partial}{\partial y}& \frac{\partial}{\partial z} \\
P& Q& R
\end{matrix} \right| \,\mathrm{d}S
$$

## 证明

略