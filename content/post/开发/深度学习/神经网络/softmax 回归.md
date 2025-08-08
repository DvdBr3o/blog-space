---
title: softmax 回归
date: 2025-07-15T01:24:09+08:00
lastmod: 2025-07-16T18:08:26+08:00
tags:
  - 深度学习
  - 回归
  - 概率统计
categories: 深度学习
publish: true
---

也是一种广义[感知机](./%E6%84%9F%E7%9F%A5%E6%9C%BA.md)

## 构成

![image.png](https://s2.loli.net/2025/07/15/8D3gj9anqxOLHV1.png)

- 线性部分: $$\boldsymbol{y}=W\boldsymbol{x}+\boldsymbol{b}=\begin{bmatrix}w_{1} \\ w_{2} \\ \vdots \\ w_{m}\end{bmatrix}\boldsymbol{x}+\boldsymbol{b}$$
- 激活函数: $$\mathrm{softmax(\boldsymbol{y})}$$

>[!note] softmax 函数
> $$\mathrm{softmax}(x_{k})=\frac{\exp x_{k}}{\sum_{i=1}^{n} \exp x_{i}}$$

## 损失函数

用[交叉熵](./%E4%BA%A4%E5%8F%89%E7%86%B5.md)作为损失函数

$$
\boldsymbol{L}=\frac{1}{T}\sum_{j=1}^{T} \mathrm{Entropy}(\boldsymbol{y}^{(j)},\hat{\boldsymbol{y}}^{(j)})
$$

即
$$
\boldsymbol{L}=-\frac{1}{T}\sum_{j=1}^{T} \boldsymbol{y}^{(j)}\cdot \log_{2}\hat{\boldsymbol{y}}^{(j)}
$$
aka
$$
L_{i}=-\frac{1}{T}\sum_{j=1}^{T} y_{i}^{(j)}\cdot \log_{2}\hat{y}_{i}^{(j)}
$$
代入 softmax 后为
$$
L_{i}-\frac{1}{T}\sum_{j=1}^{T} y_{i}^{(j)}\cdot \log_{2} \frac{\exp(w_{i}x^{(j)})}{\sum_{c=1}^{n} \exp(w_{c}x^{(j)})}
$$

>[!note] 约定
>- $i$ 为第 $i$ 维回归, $\mathrm{max}\,i=\mathrm{lineof}\,W$
>- $j$ 为第 $j$ 个样本, $\mathrm{max}\,j=T$
