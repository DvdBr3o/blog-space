---
title: ssh known hosts
date: 2025-07-13T23:13:58+08:00
lastmod: 2025-07-13T23:16:56+08:00
tags:
  - ssh
category: SSH
publish: true
---

## 问题

![image.png](https://s2.loli.net/2025/07/13/LIaHvYiJloECMP1.png)

## 解决

先联系管理员或自己检查没有遇到中间人攻击，再更新 known hosts

```bash
# ssh-keygen -R <host_ip>
ssh-keygen -R 113.45.235.142
```

再重新连接，选 `yes` 更新 known hosts

```bash
# ssh -p <port> <username>@<host_ip>
ssh -p 22 dvdbr3o@113.45.235.142
```