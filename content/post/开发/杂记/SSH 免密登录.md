---
title: SSH 免密登录
date: 2026-01-25T04:44:25+08:00
lastmod: 2026-01-25T04:45:27+08:00
tags:
  - ssh
publish: true
---

## 生成密钥

```bash
ssh-keygen -t rsa -b 4096 -C "dvdbr3o@qq.com"
```

## 上传公钥

```bash
#!/bin/nu
open ~/.ssh/id_rsa.pub | ssh username@host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

```bash
#!/bin/bash
cat ~/.ssh/id_rsa.pub | ssh username@host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```
