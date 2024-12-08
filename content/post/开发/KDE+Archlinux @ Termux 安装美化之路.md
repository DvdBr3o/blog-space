---
title: KDE+Archlinux @ Termux 安装美化之路
date: 2024-12-08T16:42:04+08:00
lastmod: 2024-12-08T22:10:00+08:00
tags:
  - archlinux
  - kde
  - termux
publish: true
categories: Linux
---

## 前情提要

[archlinux @ termux @ ColorOS](../../../archlinux%20@%20termux%20@%20ColorOS.md) 本来 ColorOS 的 termux 一直处于瘫痪状态。经过 ColorOS 15 后的第二次更新，OnePlus Pad Pro 终于不会再一直在你安装包的时候弹窗还删你包了 🎉

美中不足是 ColorOS (或者说所有 Android 14+？) 权限越缩越紧，导致 `lspci` 会被 `Permission Denied`。从而就导致一大批 Wayland Compositor 没办法在 unrooted termux 上运行。。~~（NO~ 我的 Hyprland 😭😭）~~

你知道的，我勒紧裤头才省钱省出来买个平板，不想随随便便 root，真怕变板砖。。。所以只好委屈一下用 x11 的 window manger 了。。为了避免太多 hacking，最终选定了比较成熟的 **KDE**。
## 安装 termux & archlinux

```cardlink
url: https://akawa.ink/2023/09/29/install-termux-and-proot-and-archlinux-desktop-on-android
title: "安装 termux 和 proot，并安装 archlinux 桌面"
description: "1.安装 termux去 https://github.com/termux/termux-app 下载并安装 2.打开 termux 执行下面的命令12345$ pkg update$ pkg upgrade$ pkg install x11-repo proot-distro pulseaudio vim$ pkg install termux-x11-nightly virglrendere"
host: akawa.ink
favicon: https://akawa.ink/img/favicon.ico
```

因为 xfce 不是很好看，也不太好定制，所以后面管关于 `vnc` 和 `xfce4` 的部分不看，转而使用 `kde plasma` 和更新更好的 `termux-x11`。
## 安装 KDE Plasma

```bash
yay -S plasma-meta
```

然后在 termux 下写个快捷脚本，借鉴 https://github.com/LinuxDroidMaster/Termux-Desktops/blob/main/scripts/proot_arch/startkde_arch.sh ：

```bash
#!/data/data/com.termux/files/usr/bin/bash

# Kill open X11 processes
kill -9 $(pgrep -f "termux.x11") 2>/dev/null

# Enable PulseAudio over Network
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Prepare termux-x11 session
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :1 >/dev/null &

# Wait a bit until termux-x11 gets started.
sleep 3

# Launch Termux X11 main activity
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1

# Login in PRoot Environment. Do some initialization for PulseAudio, /tmp directory
# and run KDE as user droidmaster.
# See also: https://github.com/termux/proot-distro
# Argument -- acts as terminator of proot-distro login options processing.
# All arguments behind it would not be treated as options of PRoot Distro.
proot-distro login archlinux --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - dvdbr3o -c "DISPLAY=:1 dbus-launch startplasma-x11"'

exit 0
```

然后用这个脚本进 arch 就可以看到 KDE 了！！

## 修改分辨率

默认分辨率是 3000x15__，忘了，但是不重要，这么宽，这么大的分辨率在我平板上我怎么看？而且它还强制默认只有这一种分辨率。。所以要手动缩小分辨率，用到 `xrandr`。

```cardlink
url: https://dev.to/ksckaan1/setting-up-custom-screen-resolution-on-linux-permanently-1abg
title: "Setting up Custom Screen Resolution on Linux (Permanently)"
description: "Perhaps, you have searched how to setting custom screen resolution or just resolution on Linux..."
host: dev.to
favicon: https://media2.dev.to/dynamic/image/width=32,height=,fit=scale-down,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2F8j7kvp660rqzt99zui8e.png
image: https://media2.dev.to/dynamic/image/width=1000,height=500,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fczsz72zmpp7lj1geqcxj.png
```

不知道是啥蜜汁问题，`startplasma-x11` 进系统竟然没有加载 `~/.xprofile` / `~/.xsession` / `~/.xinitrc` ？？浪费我一下午时间 😅 问我为什么不用 `/etc/profile`？要是 `profile` 在 `kde` 之后执行那我能不乐意😅 但想想就是不可能，必须找个能在 `plasma` 启动后的 startup script 方案。

```cardlink
url: https://docs.kde.org/stable5/en/plasma-workspace/kcontrol/autostart/index.html
title: "Autostart"
host: docs.kde.org
```

最后解决方案是用 `kde-workspace`。在 `~/.config/plasma-workspace/env/` 下的脚本都会在 `plasma` 启动后执行。于是在 `~/.config/plasma-workspace/env/display.sh`：

```bash
#!/bin/bash
# Display Resolution
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --newmode "1280x768_60.00"   79.50  1280 1344 1472 1664  768 771 781 798 -hsync +vsync
xrandr --addmode "Builtin Display" "1920x1080_60.00"
xrandr --addmode "Builtin Display" "1280x768_60.00"

xrandr --output "Builtin Display" --mode "1920x1080_60.00"

```

最后发现 termux-x11 设置里 `Output > Display resolution mode` 改为 `exact` 并指定分辨率好像就可以解决。。。😅

浪费了周末的一个下午。。😭😭😭😭

## 中文支持

前面的 blog 提到了本地化而且讲的很清楚，但是要注意的是一定要先下一个中文字体，否则中文还是都是问号乱码：

```bash
yay -S ttf-harmonyos-sans # 鸿蒙一般般，但是它字体确实好看
```



- [ ] TODO: 今晚好晚了，明天还要上课，现在先去洗澡。还有好多好多美化工作，最后还有重量级就是看能不能支持 Vulkan 开发了。。。