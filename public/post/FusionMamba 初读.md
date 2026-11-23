---
title: FusionMamba 初读
date: 2026-03-19T17:21:53+08:00
lastmod: 2026-03-20T18:54:15+08:00
tags:
  - mamba
  - 深度学习
categories: 深度学习
publish: true
---

## Overview

整体 Unet 架构

1. 下降 每一层
	1. Patch merging
	2. DVSS2 dynamic vision state space
	3. DFFM dynamic feature fusion module 留给上升层拼接
2. 上升 Decoder
	1. Patch expanding
	2. DVSS2

## DVSS

1. LN LayerNorm
2. ESSM efficient state space module
	1. ES2D efficient 2D scanning
3. ECA efficient channel attention

## DFFM

1. DFEM dynamic feature enhancement module
2. CMFM cross modality fusion mamba

## 损失函数

线性加权
1. $L_{int}$ := intensity loss (红外)
2. $L_{text}$ := texture loss (纹理)
3. $L_{ssim}$ := structure loss (形状)

看不懂
