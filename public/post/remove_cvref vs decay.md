---
title: remove_cvref vs decay
date: 2025-03-05T21:04:41+08:00
lastmod: 2025-07-11T22:41:21+08:00
tags:
  - cpp
categories: C++
publish: true
---


```cardlink
url: https://stackoverflow.com/questions/74257533/difference-between-stddecay-and-stdremove-cvref
title: "Difference between std::decay and std::remove_cvref?"
description: "Does std::remove_cvref replace std::decay after C++20?From this link,I cannot understand what this means:C++20 will have a new trait std::remove_cvref that doesn't have undesirable effect of std::"
host: stackoverflow.com
image: https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded
```


| T        | `std::decay` | std::remove_cvref |
| -------- | ------------ | ----------------- |
| 非函数非原生数组 | remove cvref | remove cvref      |
| 函数       | 函数指针         | remove cvref      |
| 原生数组     | 指针           | remove cvref      |
