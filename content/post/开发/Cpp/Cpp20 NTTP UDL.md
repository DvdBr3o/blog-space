---
title: Cpp20 NTTP UDL
date: 2026-01-22T03:06:12+08:00
lastmod: 2026-01-22T03:08:16+08:00
tags:
  - cpp
  - nttp
  - udl
categories: C++
publish: true
---

从 C++20 开始，用户定义字面量运算符 (user-defined literals, UDL) 允许接受一个 NTTP 参数，从而完成从字面量构建编译期对象！

```cpp
template<FixedString fs> 
constexpr auto operator""_fs() { 
	return fs; 
}
```