---
title: pars 匹配原语
date: 2025-12-27T22:02:51+08:00
lastmod: 2025-12-27T22:14:50+08:00
tags:
  - 编译
  - 开发
  - cpp
publish: true
---

## 匹配原语


| **类型**   | **原语**     | **形式**                 | **作用** |
| -------- | ---------- | ---------------------- | ------ |
| char     | Char       | `c('')`                |        |
| char     | CharSet    | `cset(''...)`          |        |
| char     | CharRange  | `cran('', '')`         |        |
| char     | AnyChar    | `cany`                 |        |
| combine  | Sequential | `a >> b`               |        |
| combine  | Choice     | a \| b                 |        |
| combine  | Optional   | `-a`                   |        |
| combine  | Repeatable | `*a`                   |        |
| combine  | OnceOrMore | `+a`                   |        |
| peek     | PeekIs     | `~a`                   |        |
| peek     | PeekNot    | `!a`                   |        |
| topology | Fix        | `fix(self -> f(self))` |        |

## 匹配优化


| **优化律**  | **优化前**                       | **优化后**          |     |
| ----------- | -------------------------------- | ------------------- | --- |
| 左分配律    | `(a >> b)` \| `(a >> c)`         | `a >>` (`b` \| `c`) |     |
| 幂等律      | `a` \| `a`                       | `a`                 |     |
| 吸收律      | `*a >> a`                        | `+a`                |     |
| 吸收律      | `a` \| `*a`                      | `*a`                |     |
| 双重否定律  | `!!a`                            | `a`                 |     |
| peek 合并   | `!a` \| `(!a >> b)`              | `!a`                |     |
| peek 吸收   | `~a >> a`                        | `a`                 |     |
| char 并集化 | `c('a')` \| `c('b')`             | `cset('a', 'b')`    |     |
| char 区间化 | `c('a')` \| `c('b')` \| `c('c')` | `cran('a', 'c')`    |     | 
