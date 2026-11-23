---
title: NixOS 安装 最小配置
date: 2026-05-10T23:53:43+08:00
lastmod: 2026-05-10T23:55:14+08:00
tags:
  - nixos
publish: true
---

```sh
sudo vim /mnt/etc/nixos/configuration.nix
```

进行如下最小配置，剩下的进入系统再配置 (e.g. use flakes rebuild nixos)

```nix
{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  users.users.yourname = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "nixos"; # 设个简单的，进去再改
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; 
}
```
