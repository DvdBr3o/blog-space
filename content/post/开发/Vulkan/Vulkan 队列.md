---
tags:
  - vulkan
title: Vulkan 队列
date: 2024-12-13T14:10:03+08:00
lastmod: 2025-03-17T14:36:10+08:00
publish: true
categories: Vulkan
---


```cardlink
url: https://stackoverflow.com/questions/55272626/what-is-actually-a-queue-family-in-vulkan
title: "What is actually a Queue family in Vulkan?"
description: "I am currently learning Vulkan, right now I am just taking apart each command and inspecting the structures to try to understand what they mean.Right now I am analyzing QueueFamilies, for which I ..."
host: stackoverflow.com
image: https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded
```

## 队列 Queue

指令运行的场所。

同一队列的指令按顺序执行。不同队列的指令不保证顺序，除非使用同步原语 (如 `Semaphore` )

一个队列可以运行一种或多种指令：

| 队列类型           | 命令类型                                             | 开始命令                |
| -------------- | ------------------------------------------------ | ------------------- |
| Graphics       | Graphics Pipeline Commands                       | `vkCmdDraw*`        |
| Compute        | Compute Pipeline Commands                        | `vkCmdDispath`      |
| Transfer       | Transfer/Copy Commands                           | `vkCmdCopy`         |
| Sparse Binding | change the binding of sparse resources to memory | `vkQueueBindSparse` |

一般最老的支持 Vulkan API 的设备也会有至少一个同时有以上四种能力的队列。

一个队列一次只能有一个线程提交。但是每个队列的提交可以同时进行。

## 队列族 Queue Family

一个队列族包含具有同样指令能力的多个队列。(类似于队列是实例，队列族是类)

