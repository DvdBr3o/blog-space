---
title: Church Bool
date: 2026-05-06T20:55:02+08:00
lastmod: 2026-05-08T12:40:25+08:00
tags:
  - 编译
  - 函数式
publish: true
---


$$
\left\{ \begin{aligned}
\mathrm{True} & := x \to y \to x \\
\mathrm{False} & := x \to y \to y \\
\mathrm{If} & := \mathrm{condition} \to \mathrm{condition}(\mathrm{true\_branch})(false\_branch) \\
\end{aligned} \right.
$$
