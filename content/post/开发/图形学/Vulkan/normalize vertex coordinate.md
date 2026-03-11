---
title: normalize vertex coordinate
date: 2025-03-06T14:52:30+08:00
lastmod: 2025-04-04T00:42:32+08:00
tags:
  - vulkan
  - shader
categories: Vulkan
publish: true
---

```glsl
// normalize vertex coordinate
vec2 uv = fragCoord / inResolution.xy * 2.0 - 1.0;
float aspect = inResolution.x / inResolution.y;
uv.x *= aspect;
```
