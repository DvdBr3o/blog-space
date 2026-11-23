---
title: 解决 docker proxy connect refused
date: 2025-07-14T04:14:16+08:00
lastmod: 2025-07-14T05:28:35+08:00
tags:
  - docker
  - proxy
categories: Docker
publish: true
---

```cardlink
url: https://github.com/clash-verge-rev/clash-verge-rev/issues/3488#issuecomment-2888416366
title: "[BUG] 开启系统代理后无法拉取docker镜像 · Issue #3488 · clash-verge-rev/clash-verge-rev"
description: "问题描述 / Describe the bug 开启系统代理后使用docker拉取镜像时提示： proxyconnect tcp: dial tcp 127.0.0.1:7897: connect: connection refused 只有关闭系统代理后才能正常拉取，使用tun也能正常拉取，即只要设置里系统代理开启了就会报错 软件版本 / Verge Version v2.2.3 复现步骤..."
host: github.com
favicon: https://github.githubassets.com/favicons/favicon.svg
image: https://opengraph.githubassets.com/c63a091f4692667119afb3efadbb90dd1f9d2951c3c8621a24e3167dda12c041/clash-verge-rev/clash-verge-rev/issues/3488
```
