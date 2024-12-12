---
title: C++ 错误机制
date: 2024-12-12T12:57:31+08:00
lastmod: 2024-12-12T13:05:48+08:00
tags:
  - cpp
categories: C++
publish: true
---

## 备选方式

不看 outdated 的方式，只看 modern C++ 的错误处理方式主要是以下几种：

+ 异常 exception
+ std::expected<T, E> (since C++23 or with `tl_expected`)
+ assert/panic

## 使用情景

为了开销考虑，很有可能是无法 exclusively 选择其中一种的，需要按照错误发生的可能性进行特定选择。

| 错误机制          | 运行开销         | 使用情景                        |
| ------------- | ------------ | --------------------------- |
| exception     | 错误路径动态分配     | 默认情形，非常肯定出错无法解决就 `noexcept` |
| std::expected | Error 空间分配开销 | 错误路径可能性大且可解决，如 io 错误        |
| assert/panic  | 无            | 非常肯定出错无法解决                  |

