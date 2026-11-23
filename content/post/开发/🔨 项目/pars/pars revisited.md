---
title: pars revisited
date: 2026-11-23T17:43:43+08:00
lastmod: 2026-11-23T23:12:34+08:00
publish: true
---
## 前情提要

### pars, first encountered

一开始想做 pars : PEG $\to$ CUDA, 具体思路是 $$\text{PEG} \mapsto \text{sequential for-if program} \xlongrightarrow{\text{monoid analysis}} \text{scan/scatter/sort-based CUDA program}$$ 与高人讨论得到以下指点:
1. 都 map 到 for-if program 再做本质投机加速了，
	1. 怎么跟 general purpose seq2par compiler 比？已经存在一个 such case 叫 [`bend`](https://github.com/bendlang/bend/) 了，那你工作的 novelty 成立吗
	2. 怎么跟硬件的投机设施比？
		1. 分支预测
		2. gpu warp masking-branch
2. pars 如何解决 branch-rich 的语法？高人认为 json 并不本质 branch-rich, 或者类似的数据描述语言 DDL 并不能代表所有 PEG 文法，属实 overclaim

### "rebuttal"

当时确实考虑不太充分，现在 revisit 后有以下非正式 *"rebuttal"*
1. to Q1
	1. 跟 general purpose seq2par compiler 比
		1. seq2par 是 NP-hard 问题 $\implies$
			1. 无论是 pars 还是 [`bend`](https://github.com/bendlang/bend/) 本质都是启发式
			2. pars 限定了 parser generator 场景，有更多良好性质，能做更多优化
		2. [`bend1`](https://github.com/HigherOrderCO/Bend1) 采用交互网建模计算，但是我不认为他对硬件是薄抽象
			1. 从用交互网建模数字类型就可见一斑，这样运算数字不可能比硬件编码快
			2. 这里陷入两难
				1. 要么为了性能引入硬件编码原语 (非纯交互网)
				2. 要么为了验证/抽象优雅在性能上更慢
				3. ~~或许可以做一个交互网 FPGA, 但性能问题转嫁到硬件~~
			3. 数字编码问题绝对不是这类 math-ish 虚拟机 (HVM of `bend`, GHC, ...) 在高性能编译上的唯一两难问题. 
		3. [`bend2`](https://github.com/bendlang/bend/) 不再采用交互网作为计算模型
	2. 跟硬件投机设施比，见 to Q2
2. to Q2
	1. **确实 overclaim 了**，在 [Motivation, revisited](pars%20revisited.md#Motivation,%20revisited) 我会提到更准确的 novelty 表述
	2. 本质上无论是 simdjson, cuJSON 还是 pars, 做的都**不是把 parser 程序完全放到 warp 做并行/投机并行**；而是把 structure recogntion 放到 gpu 做 skimming， 精细的 branchy 的子结构还是 lazy 的在 cpu 上运行的. 
	3. 这种模式能否有加速，**取决于 structure recognition 是否 monoid friendly & GPU friendly 以及如何划分 structure recognition 的粒度**. pars 能证明对于 VPG 子语法能通过 stack monoid 做到高效的 GPU scan, 而对于不存在 VPG 子语法的 PEG 语言也能自动退化到全串行. 所以某种程度上有 overclaim，但某种程度上也没太 overclaim.
 
## Motivation, revisited

### Motivation & Novelty

1. 编译期从 PEG 文法识别 VPA/EVPA 子结构的算法
2. 从 VPG 自动推导成 monoid 从而转化成 GPU scan
3. 整条基于 C++ metaprogramming 的 PEG -> VPG -> monoid -> CUDA 的工具链

### Boundaries

1. 不把所有非终结符和表达式都 GPU 化
2. 不覆盖非 visibly-pushdown 文法. 无括号保护的递归、依赖栈的谓词等不满足 VPG 条件，直接 fallback 到 CPU，而不是强行投影. 因为此时 end2end overhead 掩盖了 gpu structure recognition benefits，任何算法都未必能用 GPU 得到收益.

## Methodology, revisited

TODO

## Evalutation, revisited

TODO