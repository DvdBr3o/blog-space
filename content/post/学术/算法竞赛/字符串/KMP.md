---
tags:
  - algorithm
  - 字符串
dg-publish: "true"
publish: true
title: KMP
date modified: 星期三, 十二月 4日 2024, 4:33:27 下午
date: 星期四, 十一月 21日 2024, 6:50:02 晚上
---

```cardlink
url: https://oi-wiki.org/string/kmp/
title: "前缀函数与 KMP 算法 - OI Wiki"
description: "OI Wiki 是一个编程竞赛知识整合站点，提供有趣又实用的编程竞赛知识以及其他有帮助的内容，帮助广大编程竞赛爱好者更快更深入地学习编程竞赛"
host: oi-wiki.org
favicon: ../../favicon.ico
```

## 前缀函数 $\pi[i]$

### 定义

最长相等 真前缀 & 真后缀 の 长度
$$
\pi[i] = \max_{k=0...i}\{{k: s[0 ... k] = s[i - k + 1 ... i]}\}
$$

> [!例子]
> 对于字符串 `abcabcd` 的前缀函数 $\pi[i]$ ：
> 
> | $i$ | $\pi[i]$ | 子串        | 相等前后缀  |
> | --- | -------- | --------- | ------ |
> | 0   | 0        | `a`       | `null` |
> | 1   | 0        | `ab`      | `null` |
> | 2   | 0        | `abc`     | `null` |
> | 3   | 1        | `abca`    | `a`    |
> | 4   | 2        | `abcab`   | `ab`   |
> | 5   | 3        | `abcabc`  | `abc`  |
> | 6   | 0        | `abcabcd` | `null` |

### 实现

#### 朴素实现

暴力模拟匹配，从大到小，匹配到就返回

```cpp
for (int i = 0; i < str.size(); i++)
	for (int j = i - 1; j >= 0; j--)
		if (str.substr(0, j) == str.substr(i - j + 1, j)) {
			pi[i] = j;
			break;
		}
```

#### 得配优化

**观察到**：$\pi[i + 1] - \pi[i] \le 1$

```cpp
for (int i = 0; i < str.size(); i++)
	for (int j = pi[i - 1] + 1; j >= 0; j--)
		if (str.substr(0, j) == str.substr(i - j + 1, j)) {
			pi[i] = j;
			break;
		}
```

#### 失配优化

在 $\pi[i] = \pi[i - 1] + 1$ 失配后，假定 $\pi[i] = j + 1$ 得配，则有：

$$
\begin{cases}
str[j] = str[i] \\
str[0 ... j - 1] = str[i - j ... i - 1] = str[\pi[i] - j + 1, \pi[i] - 1]
\end{cases}
$$
第二条比较关键，即 $j$ 在 $str[0 ... i]$ 是真前后缀匹配的，$\pi[i]$ 也是在 $str[0 ... i]$ 真前后缀匹配的
$\Rightarrow$ $j$ 在 $str[0 ... \pi[i] - 1]$ 是前后缀匹配的

于是有递推公式：

$$
j^{(n)} = \pi[j^{(n - 1)} - 1]
$$

:star:最终实现：

```cpp
for (int i = 0; i < str.size(); i++) {
	int j = pi[i - 1];
	while(j > 0 && str[j] != str[i]) j = pi[j - 1];
	if (str[i] == str[j]) j++;  // 判断得配，str[i] = str[j] 也算一位
                                // 如果是失配，str[i] != str[j]，那么 j = 0 不用 ++
	pi[i] = j;
}
```

时间复杂度 $O(n)$ ，**在线**算法。

## KMP

**适用**：字符串 $s$，文本 $t$ . 求 $s$ 在 $t$ 出现的所有位置 (occurrence)

### 实现

构造一个字符串 $str = s+\#+t$，其中 $\#$ 是一个同时不存在于 $s$ 和 $t$ 的字符.

记 $\pi[i]$  是 $str$ 的前缀函数. 因为存在 $\#$ ，所以 $\forall i, \pi[i] \le \left| s \right|$ .

所以 $s = t[i .. i + \left| s \right| - 1] \Leftrightarrow \pi[i + 2 * \left| s \right|] = \left| s \right|$ .

```cpp
auto find_occurrences(std::string_view text, std::string_view pattern) -> std::vector<int> {
	auto str = std::string { pattern } + '#' + text;
	std::vector<int> occurences;
	auto prefix_fn = get_prefix_fn(str); // 前缀函数
	for (int i = pattern.size() + 1; i <= str.size(); i++)
		if (prefix_fn[i] == pattern.size())
			occurences.emplace_back(i - 2 * pattern.size());
	return occurences;
}
```


- [ ] TODO: 因为字符串在 oi 中不算热点内容，所以暂时先更到 kmp 🔽 