---
title: 迁移到 C++ Module
date: 2024-12-11T23:51:35+08:00
lastmod: 2025-02-26T18:02:40+08:00
slug: 迁移到-cpp-module
publish: true
categories: C++
---


```cardlink
url: https://quadnucyard.github.io/posts/cpp/clang-std-modules.html
title: "使用 VSCode + XMake + LLVM 开发现代 C++！（llvm-mingw + clangd + modules）"
description: "使用 VSCode + XMake + LLVM 开发现代 C++！（llvm-mingw + clangd + modules） 现在已经 4202 年了，C++ 模块已经经过了长足的发展，但就模块是否得到工具支持仍然有历史遗留的争议。 本文将说明在 VSCode 下配合 XMake 和 Clangd 是可行方案，并给出指导。 先说结论，配置 xma..."
host: quadnucyard.github.io
```

## 前情提要

我的 gui 项目原本是写成 headeronly + inline 的形式。但是转念一想我这个项目最低标准也是 `C++20` ，索性一把梭哈只支持 module 的接口形式不就好了。

而且一想想 headeronly 那一改的编译时长，比 static lib 慢得满地找牙。。更别提图形学部分之外还有对 Widget 的抽象，那真是 template 满天飞，以后规模大了改一下可以放肆摸鱼等编译了估计。(现在没啥规模改一下都要 4s 编译😅) 所以急迫需要模块加快编译速度 😭😭

但考虑到智能提示对 module 落后的支持，我到现在才开始着手迁移到 module。

>[!info] C++ Module 笑话
>C++20 就已经有了 module，但是直到 2024 年的 clangd 19 才初步支持 module 的智能提示 (看 [issue](https://github.com/clangd/clangd/issues/1293) 听起来是真的非常初步)，然后截至我开始写这篇文章 📅 2024-12-11，clang 19 还没支持 Windows (or just clangd, idk)。。。

## 实践过程

- [x] TODO: 把 `ctrl` 迁移到 C++ module 📅 2025-01-31 ✅ 2025-02-16

~~（慢慢等 Clang 19 什么时候在 Windows 上实装吧。。。）~~
