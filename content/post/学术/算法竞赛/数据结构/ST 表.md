---
tags:
  - algorithm
  - 数据结构
dg-publish: "true"
title: ST 表
date: 2024-11-26T17:23:39+08:00
lastmod: 2025-04-05T13:09:26+08:00
publish: true
categories: 算法
---

## 定义

一个二维表 $f(i, j)$。

其中 $f(i, j)$ 表示区间 $\mathrm{op}\{[i .. i + 2^j - 1]\}$。

## 原理

由定义显然有状态方程：$f(i, j) = \mathrm{op}\{ f(i, j - 1), f(i + 2^{j - 1}, j - 1) \}$

查询时：$\mathrm{op}\{[l .. r]\} = \mathrm{op} \{ \mathrm{op}\{[l .. l + 2^s - 1]\}, \mathrm{op}\{[r - 2^s + 1 .. r]\} \} = \mathrm{op}\{f(l, s), f(r - 2^s + 1, s)\}$ ，其中 $s = \lfloor{\log_2{(r - l + 1)}}\rfloor$。
## 用途

解决 **可重复贡献问题**。

> [!info] 可重复贡献问题
> 指只包含运算符 $\mathrm{op}$ 操作的区间问题，其中 $\mathrm{op}$ 满足 $x \ \mathrm{op} \ x = x$。
> 例如：
> + RMQ 问题 (区间最值问题)：$\max(x, x) = x$
> + 区间 GCD 问题：$\gcd(x, x) = x$

时间复杂度：
+ 预处理 $O(n \log{n})$。 
+ 查询 $O(1)$。

**离线**，不支持增添数据。

## 实现

### 结构

```cpp
template<typename T>
struct SparseTable {
	using ST = std::vector<std::vector<T>>;
	using Op = std::function<T(const T&, const T&)>;

	ST st;
	Op op;
};
```

### 初始化

```cpp
SparseTable(const std::vector<T>& t, Op op) : op(op) {
    using std::ceil;
    using std::log2;

    auto n = t.size();
    std::size_t  s = ceil(log2(n)) + 1;
    st.assign(n, std::vector<T>(s));
    for (int i = 0; i < n; ++i) st[i][0] = t[i];
    for (int j = 1; j < s; ++j) {
        auto pj = 1 << (j - 1);  // power of j
        for (int i = 0; i + pj < n; ++i)
	        st[i][j] = op(st[i][j - 1], st[i + pj][j - 1]);
    }
}
```

### 查询

```cpp
auto SparseTable::query(std::size_t l, std::size_t r) const -> const T& {
	using std::floor;
	using std::log2;

	{ --l, --r; } // 如果是 1~n 序号
	std::size_t s = floor(log2(r - l + 1));
	return op(st[l][s], st[r - (1 << s) + 1][s]);
}
```
