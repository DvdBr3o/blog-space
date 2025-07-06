---
title: 分部积分with拟合函数证积分不等式
date: 2025-05-06T23:03:55+08:00
lastmod: 2025-05-11T15:16:27+08:00
categories: 高等数学
tags:
  - 高等数学
  - 积分
  - 不等式
publish: true
---

[🔗 数学分析中一类积分不等式的简洁证明](https://qikan.cqvip.com/Qikan/Article/Detail?id=7112559236)

```cardlink
url: https://www.bilibili.com/video/BV1HH4y1E7fy?vd_source=8f239ffdf35edff6291745a39aad66a2
title: "积分不等式证明的一个几乎万能的方法-你确定不来看看?_哔哩哔哩_bilibili"
description: "更多内容见主页简介, 视频播放量 26942、弹幕量 21、点赞数 1155、投硬币枚数 526、收藏人数 2329、转发人数 212, 视频作者 小白考研竞赛数学, 作者简介 《如果你听不懂，那一定是我没有表达清楚》全国大学生数学竞赛非数类国家一等奖(全国前十)qq考研竞赛交流群:638868033，相关视频：高数每日一题92  积分余项的Taylor展开证明积分不等式，分段估计&内插法证明积分不等式[竞赛考研数学必会方法-特训第24天]，微分不等式证明-第1集：构造函数+单调性（考研重点），[五一专辑,直接解决一类积分不等式,秒杀即可!]柯西施瓦茨不等式-多项式拟合&分部积分转移导数(拟合函数不分段)，本场MVP一个万能的方法-分部积分+拟合[不等式证明]，阿达玛不等式最详细讲解！，内插法证明积分不等式，都是套路题而已,看小白如何分析秒杀[分段估计求极限]，这类积分不等式教你如何解决，干货来了!!一类积分不等式的完整总结,看了不后悔!"
host: www.bilibili.com
image: https://i2.hdslb.com/bfs/archive/cba0838a7c33195d80626fc79dbe48e3732db479.jpg@100w_100h_1c.png
```

---

## 形式

$$
\int_{a}^{b} F(f') \, \mathrm{d}x \leq C\int_{a}^{b} F(f) \, \mathrm{d}x
$$

通常 $F(f)=f^{2}$

## 解法

1. 找出最优函数 $\bar{f}$
   - 题目给出
   - 插值拟合
     - Lagrange 插值
     - Hermite 插值
   - 背景知识
     - Parseval 等式
2. 构造
   - $f=\varphi(x)\cdot \bar{f}$
   - $f'=\varphi'\cdot \bar{f}+\varphi\cdot \bar{f}'$
3. 不等式移到一边，带入 3. 中替换掉 $f$, $f'$ 证 $$\int_{a}^{b} F(f'(\varphi,\bar{f}))-F(f(\varphi,\bar{f})) \, \mathrm{d}x \leq 0 $$
4. 展开+分部积分
