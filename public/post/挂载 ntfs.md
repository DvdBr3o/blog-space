---
title: 挂载 ntfs
date: 2026-08-05T15:18:51+08:00
lastmod: 2026-10-19T11:42:51+08:00
tags:
  - linux
  - ntfs
  - filesystem
publish: true
---
## 挂载

```bash
lsblk -f
```

查待挂载分区的 `UUID`， say `UUUID=2F220179A71C111F`

在 `/etc/fstab` 添加：

```
UUID=2F220179A71C111F                     /mnt/windisk/d ntfs3 defaults,uid=1000,gid=1000,iocharset=utf8,dmask=022,fmask=133,umask=000,windows_names,nofail 0 0
```

依次是
- filesystem `UUID=...`
- mount point `/mnt/...`
- type `ntfs3`
	- `ntfs3` 是 linux 内核支持的 ntfs 挂载驱动
	- `ntfs-3g` 是完全用户态实现的驱动，慢但安全一点
- options
	- `nofail` 防止挂载失败直接内核 crash
- dump
- pass

## 修复脏块

```bash
lsblk -f
```

看中待修复分区的 NAME, say `nvme0n1p4`

```bash
sudo ntfsfix --clear-dirty /dev/nvme0n1p4
```

where `ntfsfix` 好像是 `ntfs-3g` 包里的工具