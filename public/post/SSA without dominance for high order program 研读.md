---
title: SSA without dominance for high order program 研读
date: 2026-07-21T23:02:05+08:00
lastmod: 2026-07-22T01:03:52+08:00
tags:
  - plt
  - ir
  - llvm
publish: true
---

```cardlink
url: https://arxiv.org/abs/2604.09961
title: "SSA without Dominance for Higher-Order Programs"
description: "Dominance is a fundamental concept in compilers based on static single assignment (SSA) form. It underpins a wide range of analyses and transformations and defines a core property of SSA: every use must be dominated by its definition. We argue that this reliance on dominance has become increasingly problematic -- both in terms of precision and applicability to modern higher-order languages. First, control flow overapproximates data flow, which makes dominance-based analyses inherently imprecise. Second, dominance is well-defined only for first-order control-flow graphs (CFGs). More critically, higher-order programs violate the assumptions underlying SSA and classic CFGs: without an explicit CFG, the very notion that all uses of a variable must be dominated by its definition loses meaning.  We propose an alternative foundation based on free variables. In this view, $ϕ$-functions and function parameters directly express data dependencies, enabling analyses traditionally built on dominance while improving precision and naturally extending to higher-order programs. We further present an efficient technique for maintaining free-variable sets in a mutable intermediate representation (IR). For analyses requiring additional structure, we introduce the nesting tree -- a relaxed analogue of the dominator tree constructed from variable dependencies rather than control flow.  Our benchmarks demonstrate that the algorithms and data structures presented in this paper scale log-linearly with program size in practice."
host: arxiv.org
favicon: https://arxiv.org/static/browse/0.3.4/images/icons/favicon-32x32.png
image: https://arxiv.org/static/browse/0.3.4/images/arxiv-logo-fb.png
```

## 概要

1. 传统 SSA 依赖 CFG 以及 dominance 做优化 pass
	1. 哪怕 CPS (GUILE CPS soup, 早期 thorin mimir) 都会构建一个 derived cfg 做分析
2. 但是 CFG 实际上是对 data dependency 的 overapproximation
	1. 比如 A(x, y) 用 $\phi$ 节点 dominates B(z)
	2. 但是 z 完全没有用到 x y
	3. 此时 CFG domination 对 data dependency 产生了 overapproximation
3. 完全可以只跟踪 data dependency 来做优化
	1. 通过 free variable 分析 (自由变量就是依赖数据，不是吗)
	2. 结果比 CFG 分析
		1. 编译时间更少 (CFG 每次图重构都得重新算，但是 free variables 不用，或者更好缓存)
		2. 优化水平相当甚至更好 (比如 DCE DSE 更激进)

## 语义

denoted as $\lambda_{G}$



## nesting




## 实现算法

递进优化

1. Hash-consed, Ordered Arrays
2. Ordered Trie
3. Indexed Trie
	1. 最终实现，大多场景下比 immer 好