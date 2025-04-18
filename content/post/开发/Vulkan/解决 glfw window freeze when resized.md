---
title: 解决 glfw window freeze when resized
date: 2025-03-29T13:07:04+08:00
lastmod: 2025-03-29T13:10:27+08:00
tags:
  - graphics
  - window
  - glfw
categories: Graphics
publish: true
---

## 问题

至少在 windows 下，glfw window 在 resize 时整个窗口会停止渲染，直到 resize 结束

## 分析

```cardlink
url: https://www.reddit.com/r/vulkan/comments/8334de/example_for_swapchain_recreation_while_resizing/
title: "Reddit - The heart of the internet"
host: www.reddit.com
```

windows 下的 event loop 在 window resize 时会阻塞，体现在 `glfwPollEvents()` 也阻塞了

## 方案

要把 render 和 window event loop 放在不同的线程，防止阻塞

- [ ] TODO: 完成[解决 glfw window freeze when resized > 方案](%E8%A7%A3%E5%86%B3%20glfw%20window%20freeze%20when%20resized.md#) 的详细解决代码 📅 2025-05-28
