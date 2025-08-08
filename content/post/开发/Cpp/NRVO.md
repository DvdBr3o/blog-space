---
tags:
  - cpp
  - 优化
categories: C++
title: NRVO
date: 2025-07-18T20:37:52+08:00
lastmod: 2025-07-19T23:53:27+08:00
publish: true
---

NRVO aka. Named Return Value Optimization

## 机制

若
- 局部变量
- 该变量与范围类型**完全一致**
- 直接写 `return expr;`

则
- 直接在 caller 的栈上构造并操作变量

>[!warning] 违反该机制 の Bad Practice
>1. 局部变量 + `return std::move(expr);`
>2. 成员变量 + `return expr;` 当想要转移所有权
