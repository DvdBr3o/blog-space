---
title: C++ 错误机制
date: 2024-12-12T12:57:31+08:00
lastmod: 2024-12-12T19:26:06+08:00
tags:
  - cpp
categories: C++
publish: true
slug: cpp-错误机制
---

## 备选方式

不看 outdated 的方式，只看 modern C++ 的错误处理方式主要是以下几种：

+ 异常 exception
+ std::expected<T, E> (since C++23 or with `tl_expected`)
+ assert/panic

## 使用情景

为了开销考虑，很有可能是无法 exclusively 选择其中一种的，需要按照错误发生的可能性进行特定选择。

| 错误机制          | 运行开销         | 使用情景                                                          |
| ------------- | ------------ | ------------------------------------------------------------- |
| exception     | 错误路径动态分配     | 默认避免使用异常以防开销，非常肯定出错无法解决就 `noexcept`，如果抛出就 crash 则与 assert 无差别 |
| std::expected | Error 空间分配开销 | 错误路径可能性大且倾向于可解决，如 io 错误                                       |
| assert/panic  | 无            | 非常肯定出错无法解决                                                    |

## 推荐策略

在 modern c++ 可以避免使用 `assert`。`assert` 可以作为逻辑检查的补充。

而在 `exception` 和 `std::expected` 的选择，可以顾名思义：
+ `exception`：意料之外的错误，无法解决，抛出并最好 crash。概率在 1% 下时可以考虑。
+ `std::expected`：意料之中的错误，可以解决，显式处理。错误路径概率不低。