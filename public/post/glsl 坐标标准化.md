---
title: glsl 坐标标准化
date: 2025-09-27T00:57:31+08:00
lastmod: 2025-09-29T16:43:24+08:00
tags:
  - glsl
publish: true
---

```glsl
vec2 uv = fragCoord.xy / iResolution.xy;
uv = uv * 2.0 - 1.0;
uv.x *= iResolution.x / iResolution.y;