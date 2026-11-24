---
title: pars revisited
date: 2026-11-23T17:43:43+08:00
lastmod: 2026-11-25T01:49:39+08:00
publish: true
---
## 前情提要

### pars, first encountered

一开始想做 pars : PEG $\to$ CUDA, 具体思路是 $$\text{PEG} \mapsto \text{sequential for-if program} \xrightarrow{\text{monoid analysis}} \text{scan/scatter/sort-based CUDA program}$$ 与高人讨论得到以下指点:
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

### Concepts

- PEG := you already knew
- VPG = Visibly Pushdown Grammar $\subsetneq$ PEG 
- VPA = Visibly Pushdown Automaton
	- := $(Q,\Sigma,\Gamma,\tau,q_{0},F,\sigma_{i},\delta_{i},\delta_{c},\delta_{r})$
		- $Q$ := 状态集
		- $\Sigma$ := 字母集
		- $\Gamma$ := 栈符号集
		- $q_{0}\in Q$ := 初始状态
		- $F\in Q$ := 终止状态
		- $\delta_{i}$ := interal 状态转移
		- $\delta_{c}$ := call 状态转移 (open 子规则)
		- $\delta_{i}$ := return 状态转移 (close 子规则)
- [monoid](./monoid.md)
	- ~~鸭大本科的抽象代数太偏组合了，完全没讲到 monoid~~
	- monoid 的可结合性+幺元 implies 前缀可二分，然后不断 aggregate 得到最终结果. 显而易见这非常适合上 warp
	- VPA 这种类**栈**范畴 $(S,\operatorname{push},\operatorname{pop})$ 也可以转换为 monoid $$(S,\operatorname{push},\operatorname{pop}) \simeq (\mathbb{N}\times[T], \odot, e=(0, []))$$ where 态射 $\odot$ defined by $$(n_{1},s_{1})\odot(n_{2},s_{2})=\begin{cases}(n_{1}+n_{2}-\lvert s_{1} \rvert , s_{2}) & n_{2}\geq \lvert s_{1} \rvert \\(n_{1}, s_{1}[0..\lvert s_{1} \rvert -n_{2}]\operatorname{++}s_{2}) & n_{2}<\lvert s_{1} \rvert \end{cases}$$ 详细可以看看 raphlinus 的著名博客 [The stack monoid](https://raphlinus.github.io/gpu/2020/09/05/stack-monoid.html)
	- 从而 VPA $\rightarrow$ monoid $\rightarrow$ warpable payload 变成一条清晰的性能收益路线.

### PEG $\rightarrow$ VPA $\times$ R

完全可以用 [F-algebra](https://en.wikipedia.org/wiki/F-algebra) / inducive type 建模 PEG(很巧的是，[F-algebra](https://en.wikipedia.org/wiki/F-algebra) 这种富有 [catamorphism](https://en.wikipedia.org/wiki/Catamorphism) 意味的抽象，跟 C++ template 元编程异曲同工，用模板特化很好实现)

$$
\begin{aligned}
\text{PEG} ::= \, & \operatorname{Lit}(\text{Char}) \mid\\
& \operatorname{Rng}(\text{Char}, \text{Char}) \mid \\
& \operatorname{Any} \mid \\
& \operatorname{Seq}(\text{PEG}\dots) \mid \\
& \operatorname{Alt}(\text{PEG}\dots) \mid \\
& \operatorname{Star}(\text{PEG}) \mid \\
& \operatorname{Plus}(\text{PEG}) \mid \\
& \operatorname{Maybe}(\text{PEG}) \mid \\
\end{aligned}
$$

通过对 PEG 的 seq / alt / maybe / ... 进行归纳，就可以搜索到 PEG 内的潜在 open-close rule pair, 然后形成 VPA 集合. 

```lean
def split (env : SplitEnv) : (e : PEG) → Split e
  | .lit c => singleHole (internalLiteral c)
  | .rng lo hi => singleHole (internalRange lo hi)
  | .any => singleHole internalAny
  | .seq es => finish (.seq es) (es.map (split env))
  | .alt es => finish (.alt es) (es.map (split env))
  | .star e => finish (.star e) (split env e)
  | .plus e => finish (.plus e) (split env e)
  | .maybe e => finish (.maybe e) (split env e)
  | .and e => residualLookahead (split env e)
  | .not e => residualNegative (split env e)
  | .ref r => env.reference r
```

对应的被 open-close rule pair 包含的 residual rule 就作为 CPU residual 程序，编译期嵌入到 iterator 类型作为成员函数，当被 iter 到时再 lazy 的运行这段 residual parsing code.

PEG 本身转译到 CPU program 也很显然，以 `Lit` 和 `Seq` 为例：

```cpp
template<typename rule>
struct residual {};

template<char c>
struct residual<Lit<c>> {
	constexpr auto operator(Cursor& s) const -> std::optional<char> {
		if (s.peek() == c) {
			s.bump();
			return c;
		}
		else return std::nullopt;
	}
};

template<typename... Rules>
struct residual<Seq<Rules...>> {
	constexpr auto operator(Cursor& s) const -> std::optional<std::tuple<Rules::result_type...>> {
		std::tuple<Rules::result_type...> res;
		const auto lookback = s;
		if ([&]<size_t... Is>(std::index_sequence<Is...>){
			using RulesTup = std::tuple<Rules...>;
			auto res = residual<
				std::tuple_element_t<Is, RulesTup>
			>(s);
			if (res) {
				std::get<Is>(res) = std::move(res.value());
				return true;
			} else
				return false;
			
		} && ...)
			return res;
		else {
			s = lookback;
			return std::nullopt;
		}
	}
}

template<typename RootRule>
class LazyIterator {
public:
	template<typename Rule>
	constexpr auto residual_here() -> decltype(auto) {
		return residual<Rule>(_cursor);
	}
	
	// ...

private:
	Cursor                      _cursor;
	GPUSkippablePairs<RootRule> _skippables;
	// ...
};
```

### VPA $\rightarrow$ monoid

可以详见 raphlinus 的博客 [The stack monoid](https://raphlinus.github.io/gpu/2020/09/05/stack-monoid.html) 以及 [cuJSON](https://dl.acm.org/doi/10.1145/3760250.3762222) 中的括号配对. 主要想法就是 VPA 本质上非常 stack, 所以实现上也很大程度参考了 stack monoid. 主要就是
1. 先对每个 open-close pair 扫描出 call / return 子规则位置，`gather` 到一起
2. 用前缀和 `scan` 算深度，(用 `transform_if` 调整开闭符号为同一深度)
3. 用深度当 key，open-close 符号信息当 value 做 `sort_by_key`
4. 然后得到的 `pairs` 就是形如 `[open_0, close_0, open_1, close_1, ...]` 的配对数组了

```python
def find_pair(open, close, input):
	is_open = simd_eq(open, input)  # open close 可以是非单字符，此处的
									# simd_eq 是指复合的 bitmask based
									# simd compare passes
	is_close = simd_eq(close, input)
	oc = is_open | is_close
	depth = inclusive_scan(oc)
	depth = transform_if(depth, oc, decrease(), is_open)
	zipped = zip((oc_idx, oc))
	pairs = (pair_oc, pair_idx) = stable_sort_by_key(depth, zipped)
	return pairs
```

### monoid $\rightarrow$ CUDA

可以详见 raphlinus 的博客 [The stack monoid](https://raphlinus.github.io/gpu/2020/09/05/stack-monoid.html). 用 monoid 推导出可并行前缀和然后用 GPU warp 加速是个非常古老的想法，在 monoid Object 比较小的时候，已经有成熟的 `thrust::InclusiveScan` 和 `cub::DeviceScan` 了. 而对于没那么小的 monoid Object, 虽然不那么平凡，但是还是可以构造 scrathpad aggregates 内存分布和合并算法达到很好的性能.

## Evalutation, revisited

tested on a100, 具体见 paper

选取了 3 个数据描述语言 json, xml, csv. 用各语言已有的手写 simd/cuda 加速实现作为 baseline. 当然在没有 simd/cuda 加速实现的语言上在数据描述语言的 workload context 下肯定性能收益更高，这也是 pars 的主要 intended novelty.

### Throughput

TODO

### Peak Device Global Memory

TODO