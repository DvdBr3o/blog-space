---
title: KDE + Archlinux @ Termux 安装美化之路
date: 2024-12-08T16:42:04+08:00
lastmod: 2024-12-08T23:33:47+08:00
tags:
  - archlinux
  - kde
  - termux
publish: true
categories: Linux
slug: kde-archlinux-termux-安装美化之路
---

## 前情提要

咱就是说勒紧裤头攒钱买了个平板，想着游戏本续航是根本带不到课室的，一个平板又能无纸化，又能 `termux` 敲代码，还能画个画啥的。结果 `termux` 面对 ColorOS 当场碰壁，详见 [archlinux @ termux @ ColorOS](../../../archlinux%20@%20termux%20@%20ColorOS.md)。没错，ColorOS 的 `termux` 一直处于瘫痪状态。经过 ColorOS 15 后的第二次更新，OnePlus Pad Pro 终于不会再一直在你安装包的时候弹窗还删你包了 🎉

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

因为 `xfce` 不是很好看，也不太好定制，所以后面管关于 `vnc` 和 `xfce4` 的部分不看，转而使用 `kde plasma` 和更新更好的 `termux-x11`。
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

~~（话说本来还想在 ColorOS 也全局用 HarmonyOS Sans，这何尝不是一种 NTR，结果你懂的，什么叫做主题商店啊😅）~~


- [ ] TODO: 今晚好晚了，明天还要上课，现在先去洗澡。还有好多好多美化工作，最后还有重量级就是看能不能支持 Vulkan 开发了。。。要是不能我还不如直接买个轻薄本，买个 Surface Book 不比平板好？但不管怎么说游戏本性能不如台式机，还不能承担笔记本功能的逆天事实已经被证实了。。。到底是谁在怂恿我买游戏本啊啊啊啊啊😤😤

- [ ] KDE Wallpaper Engine:

```cardlink
url: https://github.com/catsout/wallpaper-engine-kde-plugin
title: "GitHub - catsout/wallpaper-engine-kde-plugin: A kde wallpaper plugin integrating wallpaper engine"
description: "A kde wallpaper plugin integrating wallpaper engine - catsout/wallpaper-engine-kde-plugin"
host: github.com
favicon: https://github.githubassets.com/favicons/favicon.svg
image: https://opengraph.githubassets.com/43af126a03e3e45843e51f38160e2791bb0c7e7e16a5b4a3e19b398da3ccc5b9/catsout/wallpaper-engine-kde-plugin
```


```cardlink
url: https://hujiekang.top/posts/kde-customization/
title: "KDE终极美化指南"
description: "前言 近期在电脑上装了Windows+Linux双系统，日常学习和轻度办公类方面的东西都主要在Linux上进行，需要打游戏或者要用到Adobe全家桶等只有Windows才能干的事情的时候才切到Windows上去。用了也有大几个月了，Linux已经完全能够满足我的需求，包括编程、影音播放、Office文档处理、远程控制、IM软件等等在Linux上都已经拥有了较好的支持，用作主力系统完全不存在问题。既然都用作主力系统了，桌面一定得整的让自己看着舒服，于是就有了这篇文章。桌面环境的选择上，选择了性能表现好、可自定义性高而且很好看的KDE。同样使用过国产的一些桌面环境（DDE、UKUI等），个人觉得国产桌面更偏向于给小白使用，可自定义的程度不够高，但界面也足够好看。还有其他桌面环境，如GNOME、Xfce，这些纯属是用腻了，而且同样是自定义程度不够高。需要说明的是，本文的美化都是在Arch Linux下最新版本的KDE下进行的，老版本KDE可能部分功能存在差异（比如我用过的Kubuntu 20.04，KDE直接比同期的Arch Linux差一个大版本，不少功能都是缺失的）。先上两张效果图：KDE桌面环境拥有其自己的主题商店，包含了全局主题、图标包、小组件、配色方案等所有可自定义部分的主题资源。因为KDE主题商店网站在国内的速度属实不咋地而且还经常掉线，个人最推荐通过ocs-url来进行安装，能够直接通过浏览器来捕获下载文件的信息，并自动根据组件类型将主题包解包至指定的位置，基本上即装即用。当然除此之外，一些热门的主题资源也包含在了Arch Linux的AUR仓库中，可以直接通过yay安装。Arch Linux系列可以通过yay直接安装ocs-url：1 yay -S ocs-url 如果通过浏览器直接下载提示网络问题无法下载，还可以通过命令行代理，从命令行来启动ocs-url，使用方法即ocs-url [OCS URL]，对应的主题包URL（以ocs://开头）可以在主题组件下载页通过浏览器开发者工具抓取到：桌面主题的更换 KDE中一个比较完整的全局主题包含以下三个部分：全局主题：包含了整体的配色风格、Plasma视觉风格、窗口样式、界面配色方案，有的还带有一套图标以及鼠标指针 Kvantum主题：Kvantum是一个基于Qt的主题引擎，能够修改应用程序风格（窗口的毛玻璃背景就是通过这个搞定的），若一些全局主题支持背景的毛玻璃特效通常都会建议安装其对应的Kvamtum主题。通过yay -S kvantum可以安装Kvantum Manager。 其他：如欢迎屏幕的主题、Sddm主题、Konsole配色方案主题等。 全局主题我选择的是类Win10配色的We10XOS-dark，曾经用过的Layan主题也很好看。安装起来没啥技术含量，随后在设置里更换全局主题，并将应用程序风格设置为kvantum，这样Kvantum主题才能正常工作。再打开Kvantum Manager即可以应用Kvantum主题，配置页面也可以对主题进行更进一步的个性化设置。在这里有一个小坑，若系统开启了缩放比例，需要在配置主题中将禁用非整数比例的半透明取消勾选（默认是勾选了的），否则无论怎么弄毛玻璃都没法生效。窗口样式上，个人更喜欢breeze-blurred，是基于KDE默认的微风窗口样式魔改的，添加了毛玻璃的特效，与Kvantum设置的毛玻璃相结合，即可以实现整个窗口的无缝毛玻璃。举个例子，Konsole的无缝毛玻璃，只需要让Konsole配色方案的第一个背景色和系统颜色方案中的“活动标题栏”颜色一致，再让breeze-blurred的透明度和Konsole的背景透明度一致即可。这些修改完成后，整个系统的界面效果已经很舒服了，这里我还更换了图标为Fluent Icon Theme，搭配毛玻璃效果很不错。下一步是通过一些桌面组件来使得整个桌面的功能更完善，用起来更方便。一些实用的桌面小组件 Latte Dock：基本上是Linux上Dock栏的最优选了，功能相当强大，同样支持自定义的主题； Tiled Menu：一个模仿Windows 10磁贴样式的开始菜单。 Awesome Widgets：一个简约的小组件集合，可以自定义将系统的状态信息展示在桌面上，里头修改的是HTML，所以也比较灵活。另一个替代品是Netspeed Widget，当然功能没有这个强大； Panon：音频可视化组件，有一些默认样式，主题商店同样有其他人设计的样式（就是比较少），推荐这个样式，放在桌面上很好看； Clear Clock：一个放在桌面的时间组件； 全局菜单：系统自带的组件，将当前应用程序的菜单显示在任务栏上，搭配Application title可以实现类似macOS那样的顶栏，但其实不少应用都没有对应的菜单支持，相对鸡肋； 拾色器：这个是系统自带的，用于在屏幕上选取颜色，选完了可以复制其RGB值和Hex表示。 其他部分的优化 KDE默认是单击打开文件或文件夹的，可以设置 工作区行为 常规行为 点击文件或文件夹时 为选中它们，这样就变成双击了； 工作区行为 桌面特效部分里面也有一些可以调节的选项，包括各种窗口动画等； 输入法可以使用fcitx5，Arch Linux上的使用体验应该是目前最佳的，推荐一个毛玻璃主题：https://github.com/Reverier-Xu/FluentDark-fcitx5。"
host: hujiekang.top
favicon: https://hujiekang.top/apple-touch-icon.png
image: https://hujiekang.top/%3Clink%20or%20path%20of%20image%20for%20opengraph,%20twitter-cards%3E
```

