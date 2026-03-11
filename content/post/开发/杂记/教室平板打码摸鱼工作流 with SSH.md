---
title: 教室平板打码摸鱼工作流 with SSH
date: 2026-03-06T15:11:14+08:00
lastmod: 2026-03-06T15:24:53+08:00
tags:
  - ssh
  - termux
  - wsl
  - windows
publish: true
---

经历了[KDE + Archlinux @ Termux 安装美化之路](kde-archlinux-termux.md)的失败后，又想起早有听说 SSH 连主力机实现在教室听课时打码摸鱼之流，这几天实现了一下，效果非常好，基本可以胜任无图形的 coding 任务.

## Prerequisites

1. hardware
	1. Windows 主力机
	2. Android 平板
2. software
	1. tailscale
	2. windows sshd service support
	3. termux
	4. \[OPTIONAL] ToDesk

## Let's do it

### 主力机端

1. enable windows sshd server service

```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd 
Set-Service -Name sshd -StartupType 'Automatic' 
```

2. install tailscale & enable

### 平板端

1. install termux & setup

```sh
pkg install ssh
```

2. install tailscale & enable
3. start! 

```sh
ssh username@machine
# in my case
ssh dvdbr3o@dvdbr3o-laptop

# 如果你的 windows 存在 hardlink 那么会被认为是不可信任的挂载点, so use wsl
wsl
```

### 可选

#### 图形支持

如果是比较简单的图形投影，比如 html/web based，那么可以直接映射到本地端口，通过 tailscale 可以实现在平板的浏览器直接访问 `http://machine_name:port` 访问 (in my case `dvdbr3o-laptop:8080`)

但如果遇到 native vulkan / webgpu 这种几乎不可能远程转发的，最保险就是 ToDesk 远程投屏了.当然你可以 ssh 里 `nvim` 愉快代码，只有要看效果的时候再投屏.
