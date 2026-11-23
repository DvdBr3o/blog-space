---
title: NixOS 安装 手动分区
date: 2026-05-10T23:25:48+08:00
lastmod: 2026-07-25T15:24:03+08:00
tags:
  - nixos
  - 分区
  - 硬盘
publish: true
---

>[!info] 声明式分区
>可以用 [disko](https://github.com/nix-community/disko) 实现声明式 & 可复现的硬盘分区.
>这里介绍手动分区

## 检查硬盘

```sh
lsblk
```

记住硬盘名字，e.g. `sda`

## 分区 partion

```sh
cfdisk /dev/sda # /dev/<disk_name>
```

然后按顺序分区. 推荐分区

| 顺序  | 默认名字   | 格式               | 大小    |
| --- | ------ | ---------------- | ----- |
| 0   | `sda1` | EFI              | 512MB |
| 1   | `sda2` | Linux Swap       | 8GB   |
| 2   | `sda3` | Linxu Filesystem | 剩下全部  |

>[!note] 引导分区大小
>要根据引导程序类型划分 `sda1` 引导分区大小，比如 Limine 最小推荐大小是 4096 MB
>当然可能还有文件系统限制，比如 Limine 推荐 FAT32

>[!note] swap 分区大小
>swap 分区大小应该与机器内存大小保持一致


## 文件系统

1. 格式化文件系统

```sh
sudo mkfs.fat -F 32 /dev/sda1
sudo mkswap /dev/sda2
sudo swapon /dev/sda2
sudo mkfs.btrfs -L nixos /dev/sda3
```

2. 创建子卷

```sh
# 先挂载物理分区以便操作
sudo mount /dev/sda3 /mnt

# 创建子卷
sudo btrfs subvolume create /mnt/@
sudo btrfs subvolume create /mnt/@home
sudo btrfs subvolume create /mnt/@nix  # 专门存放 Nix 商店，方便以后清理

# 卸载物理分区
sudo umount /mnt
```

3. 用正确方式重新挂载

```sh
# 挂载根目录
sudo mount -o compress=zstd,subvol=@ /dev/sda3 /mnt

# 创建并挂载其他目录
sudo mkdir -p /mnt/{home,nix,boot}
sudo mount -o compress=zstd,subvol=@home /dev/sda3 /mnt/home
sudo mount -o compress=zstd,noatime,subvol=@nix /dev/sda3 /mnt/nix

# 别忘了挂载 EFI 分区
sudo mount /dev/sda1 /mnt/boot
```

4. build nixos

```sh
sudo nixos-generate-config --root /mnt
```

