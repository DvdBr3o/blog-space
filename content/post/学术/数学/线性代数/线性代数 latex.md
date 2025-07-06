---
title: 线性代数 latex
date: 2025-03-01T20:03:22+08:00
lastmod: 2025-03-02T17:33:29+08:00
tags:
  - 线性代数
  - latex
categories: 线性代数
publish: true
---

## 矩阵

### 矩阵

| 名称                          | in latex                                       | in latex package | in latex suite |
| --------------------------- | ---------------------------------------------- | ---------------- | -------------- |
| matrix                      | $M=\begin{matrix}a & b \\ c & d\end{matrix}$   | matrix           | mat            |
| **p**arentheses **mat**rix  | $M=\begin{pmatrix}a & b \\ c & d\end{pmatrix}$ | pmatrix          | pmat           |
| **b**rackets **mat**rix     | $M=\begin{bmatrix}a & b \\ c & d\end{bmatrix}$ | bmatrix          | bmat           |
| **B**races **mat**rix       | $M=\begin{Bmatrix}a & b \\ c & d\end{Bmatrix}$ | Bmatrix          | Bmat           |
| **v**ertical bar **mat**rix | $M=\begin{vmatrix}a & b \\ c & d\end{vmatrix}$ | vmatrix          | vmat           |

### 省略号

| 名称                    | in latex | in latex package | in latex suite |
| --------------------- | -------- | ---------------- | -------------- |
|                       | $\dots$  | `\dots`          | ...            |
| **v**ertical **dots** | $\vdots$ | `\vdots`         | v...           |
| **d**iagonal **dots** | $\ddots$ | `\ddots`         | d...           |

>[!note] latex suite fix
>默认 latex suite 插件无 `\vdots` 和 `\ddots` 快捷键，且和 `\dot{}` 冲突，所以可添加以下配置实现上表提及的快捷键
>```
>{trigger: "v...", replacement: "\\vdots", options: "mA"},
>{trigger: "d...", replacement: "\\ddots", options: "mA"},
>```
