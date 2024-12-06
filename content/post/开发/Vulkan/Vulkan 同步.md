---
tags:
  - vulkan
  - graphics
dg-publish: "true"
publish: "true"
title: Vulkan 同步
date: 2024-11-28T11:28:03+08:00
lastmod: 2024-12-04T16:37:42+08:00
category: Vulkan
---
主要有两种同步原语：
+ **Fence** 栅栏：用于 **应用程序 $\Leftrightarrow$  渲染**
+ **Semaphore** 信号量：用于 **指令队列内/指令队列间 の 指令间**
