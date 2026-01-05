---
title: Device 与 Queue
date: 2025-03-10T14:37:50+08:00
lastmod: 2025-03-17T14:36:30+08:00
tags:
  - vulkan
categories: Vulkan
publish: true
---

`VkQueueCreateInfo` 指定
- 队列族型号(marked by index) 
- 队列个数
一个 `VkQueueCreateInfo` 只能指定一个队列族

需要多个队列族就需要在 `VkDeviceCreateInfo` 传入多个不同的 `VkQueueCreateInfo`

**一个队列族只能声明一次**，否则 validation error

于是 Device 关于 Queue 的 create info 结构类似于：

| QueueFamilyIndex | QueueCount |
| ---------------- | ---------- |
| 0                | 1          |
| 1                | 2          |
| 3                | 2          |

就是指在该逻辑设备中映射了 `0` 型队列一个，`1` 型队列 2 个，`3` 型队列 2 个。
至于每种队列 (aka 每个队列族) 最多有几个，支持什么操作，可见 [Vulkan 队列](./Vulkan%2520%E9%98%9F%E5%88%97.md#)
