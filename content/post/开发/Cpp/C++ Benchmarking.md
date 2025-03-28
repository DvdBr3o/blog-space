---
title: C++ Benchmarking
date: 2024-12-10T23:15:57+08:00
lastmod: 2024-12-12T19:26:03+08:00
tags:
  - cpp
  - benchmark
categories: C++
publish: true
slug: cpp-benchmarking
---

## 候选名单

```bash
xrepo search benchmark
```

找到以下几个候选库：

```cardlink
url: https://github.com/google/benchmark
title: "GitHub - google/benchmark: A microbenchmark support library"
description: "A microbenchmark support library. Contribute to google/benchmark development by creating an account on GitHub."
host: github.com
favicon: https://github.githubassets.com/favicons/favicon.svg
image: https://opengraph.githubassets.com/095dd1da913d608f34cb6790f44fc8dd992145add82d9ee496425ab594ea4676/google/benchmark
```

谷歌大厂出品，但是不出意料有臭臭の宏。。

```cardlink
url: https://github.com/iboB/picobench
title: "GitHub - iboB/picobench: A micro microbenchmarking library for C++11 in a single header file"
description: "A micro microbenchmarking library for C++11 in a single header file - iboB/picobench"
host: github.com
favicon: https://github.githubassets.com/favicons/favicon.svg
image: https://opengraph.githubassets.com/dbb8c8ed06db6212dd5ad2fc07312d20434e6bc0a819ae5a280472c9f7dce07c/iboB/picobench
```

9 months ago... 估计死透了吧这库，还是 C++11 的，感觉已经可以放弃了 ~~(logo 还挺萌的)~~

```cardlink
url: https://github.com/martinus/nanobench
title: "GitHub - martinus/nanobench: Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20"
description: "Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20 - martinus/nanobench"
host: github.com
favicon: https://github.githubassets.com/favicons/favicon.svg
image: https://repository-images.githubusercontent.com/213074835/3c8f5b80-b313-11ea-9244-4e920d2d0d9e
```

支持到 C++20，seems promising。但是 example 里直接写 lambda 感觉不是很模块化，况且 lambda capture by reference 感觉也有性能误差问题。。之后详细看看

```cardlink
url: https://github.com/Compaile/ctrack
title: "GitHub - Compaile/ctrack: A lightweight, high-performance C++ benchmarking and tracking library for effortless function profiling in both development and production environments. Features single-header integration, minimal overhead, multi-threaded support, customizable output, and advanced metrics for quick bottleneck detection in complex codebases."
description: "A lightweight, high-performance C++ benchmarking and tracking library for effortless function profiling in both development and production environments. Features single-header integration, minimal ..."
host: github.com
favicon: https://github.githubassets.com/favicons/favicon.svg
image: https://opengraph.githubassets.com/0355853d13b70aca57f886710c407e982a738164718e33496d078f4734173efc/Compaile/ctrack
```

到 C++17，至少微 modern。而且打了 lightweight high-performance 的标签 ~~(在抢 nano 的饭碗吗阿喂)~~ 感觉可以一试

## 试试看！

- [x] Test cpp benchmarking tools 🔽 📅 2024-12-22 ✅ 2025-03-09

