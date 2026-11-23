---
tags:
  - 深度学习
  - 概率统计
  - 回归
categories: 深度学习
title: logistic 回归
date: 2025-07-15T01:24:09+08:00
lastmod: 2025-08-09T00:38:48+08:00
publish: true
---

```cardlink
url: https://www.bilibili.com/video/BV18u4y147ew?vd_source=8f239ffdf35edff6291745a39aad66a2
title: "【深度学习 搞笑教程】15 logistic回归 | 草履虫都能听懂 零基础入门 | 持续更新_哔哩哔哩_bilibili"
description: "1 logistic回归2 熵3 交叉熵4 交叉熵损失函数, 视频播放量 23806、弹幕量 126、点赞数 533、投硬币枚数 360、收藏人数 556、转发人数 99, 视频作者 编程八点档, 作者简介 学编程，有我在，别害怕。收看编程八点档，土鸡也能变凤凰。，相关视频：【五分钟机器学习】机器分类的基石：逻辑回归Logistic Regression，[5分钟深度学习] #01 梯度下降算法，【五分钟机器学习】机器学习的起点：线性回归Linear Regression，logistic回归到底是什么？一个视频讲清楚！小白轻松上手，逻辑回归系列汇总 Logistic Regression-零基础入门，分类：logistic回归，【机器学习】【白板推导系列】【合集 1～33】，逻辑回归十分钟学会，通俗易懂-logistics regression，这也太全了！回归算法、聚类算法、决策树、随机森林、神经网络、贝叶斯算法、支持向量机等十大机器学习算法一口气学完！，统计小白必看：回归分析的学习路径｜拯救你的论文，怎样一步步才能学好回归分析"
host: www.bilibili.com
image: https://i0.hdslb.com/bfs/archive/d77b18d5e670e2b4f88693b420303d2bea6b1c04.jpg@100w_100h_1c.png
```

属于一种广义[感知机](./%E6%84%9F%E7%9F%A5%E6%9C%BA.md)

## 构成

- 线性部分: $y=\boldsymbol{w}^{T}\boldsymbol{\chi}$
- 激活函数: sigmoid 函数

## 损失函数

采用[交叉熵](./%E4%BA%A4%E5%8F%89%E7%86%B5.md)作为损失函数

$$
L=\mathrm{Entropy(y,\hat{y})}
$$

>[!note] 二分类
> $$L=-y\log_{2} \hat{y}-(1-y)\log_{2}(1-\hat{y})$$

