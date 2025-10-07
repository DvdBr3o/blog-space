---
title: 安装 archlinux 在 wsl2
date: 2025-06-23T10:52:11+08:00
lastmod: 2025-08-10T03:16:14+08:00
tags:
  - archlinux
  - wsl
categories: Linux
publish: true
---

## 安装系统

```bash
wsl --install archlinux
wsl --set-default archlinux
```

## 更新 pacman

```bash
pacman -Syu
```

在 `/etc/pacman.d/mirrorlist` **头部** 加入:

```
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
```

[archlinux \| 镜像站使用帮助 \| 清华大学开源软件镜像站 \| Tsinghua Open Source Mirror](https://mirrors.tuna.tsinghua.edu.cn/help/archlinux/)

在 `/etc/pacman.conf` **头部** 加入:

```toml
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

并安装 keyring

```bash
pacman -Sy archlinuxcn-keyring
```

[archlinuxcn \| 镜像站使用帮助 \| 清华大学开源软件镜像站 \| Tsinghua Open Source Mirror](https://mirrors.tuna.tsinghua.edu.cn/help/archlinuxcn/)

## 更新 key

见 Archlinux 更新 key
!Archlinux 更新 key

## 设置账户

```bash
passwd root
useradd -m dvdbr3o
passwd dvdbr3o
```

### 设置 sudo 权限

```bash
pacman -S sudo
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
usermod -aG wheel dvdbr3o
```

### 设置默认登录用户

退回到 windows

```bash
wsl --manage archlinux --set-default-user dvdbr3o
```

## 安装 yay

```bash
sudo pacman -S yay
```

## 常用软件

```bash
yay -S git base-devel llvm xmake
```

## shell

```bash
yay -S nushell starship
chsh -s /bin/nu
```

[Starship](https://starship.rs/zh-CN/guide/)

在 `$nu.config-path` 中添加

```nushell
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
```
