---
title: SSH @ github 快速配置指南
date: 2024-12-09T19:28:30+08:00
lastmod: 2024-12-09T20:10:33+08:00
tags:
  - ssh
  - git
publish: true
slug: ssh-at-github-快速配置指南
---

## 本地生成 SSH key

```bash
ssh-keygen -t rsa -b 4096 -C "dvdbr3o@qq.com"`
```

enter 到底。如果需要 passphrase 可以设置一下。

> [!attention] 注意
> 在每个不同设备，以及每个相同设备的相同设备的不同平台 (如 Windows 和 WSL)，都必须注册相应的 ssh key。

## 登记到 github

直接到 [https://github.com/settings/keys](https://github.com/settings/keys) 进行 add SSH keys.

```bash
cat ~/.ssh/id_rsa.pub
```

将内容复制到 SSH key 里就好了。

## SSH 授权

```bash

ssh -T git@github.com
```

输入 yes 。

## 设置用户名和邮箱

```bash
git config --global user.name "dvdbr3o" git config --global user.email "dvdbr3o@qq.com"
```
## 克隆！

![](https://s2.loli.net/2024/12/09/jUhzxRcpfZvuabg.png)

现在选择 SSH 方式进行本地克隆吧~