---
tags:
  - vulkan
  - graphics
dg-publish: "true"
publish: "true"
title: Vulkan 同步
date modified: 星期三, 十二月 4日 2024, 4:33:19 下午
date: 星期四, 十一月 28日 2024, 11:28:03 上午
---
主要有两种同步原语：
+ **Fence** 栅栏：用于 **应用程序 $\Leftrightarrow$  渲染**
+ **Semaphore** 信号量：用于 **指令队列内/指令队列间 の 指令间**
