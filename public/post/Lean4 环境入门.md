---
title: Lean4 环境入门
date: 2026-04-09T11:40:40+08:00
lastmod: 2026-11-21T01:00:33+08:00
tags:
  - lean
  - 形式化验证
  - plt
publish: true
---
https://zhuanlan.zhihu.com/p/23813781026

## 工具链

lean4 有比较完整的工具链
- lake: 包管理器
- elan: 版本管理

有了 elan 管理好版本, lake & lean 的环境变量会自动配置好，类似于 elan = rustup, lake = cargo, lean = rustc. 所以先安装 elan!

[知乎 | Lean 工具链教程 ｜ elan & Lake](https://zhuanlan.zhihu.com/p/23813781026)

[GitHub - leanprover/elan: The Lean version manager · GitHub](https://github.com/leanprover/elan?tab=readme-ov-file#installation)

```sh
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
```

然后安装最新稳定工具链并配置环境

```sh
elan toolchain install stable
elan default stable

# validation
lake --version
lean --version
```
