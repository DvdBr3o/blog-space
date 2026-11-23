---
title: archlinux 更新签名
date: 2026-03-10T20:59:01+08:00
lastmod: 2026-03-10T21:35:15+08:00
tags:
  - linux
  - archlinux
  - pacman
publish: true
categories: Linux
---

```bash
sudo pacman -Sy archlinux-keyring 
sudo pacman-key --init 
sudo pacman-key --populate archlinux
```

如果 `archlinux-keyring` 也失效

`vim /etc/pacman.conf` 暂时设置 `[core]` 下 `SigLevel = Never`

```ini
[core]
# ...
SigLevel = Never
```

然后

```bash
sudo pacman -Sy archlinux-keyring
# 或者
sudo pacman -U https://archlinux.org/packages/core/any/archlinux-keyring/download/

sudo rm -rf /var/cache/pacman/pkg/*
sudo rm -rf /etc/pacman.d/gnupg
sudo pacman-key --init 
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
```

再记得改回来