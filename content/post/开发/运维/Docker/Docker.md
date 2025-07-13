---
title: Docker
date: 2024-12-08T15:01:37+08:00
lastmod: 2025-07-12T23:28:01+08:00
tags:
  - docker
  - server
categories: Docker
publish: true
---


```cardlink
url: https://ruanyifeng.com/blog/2018/02/docker-tutorial.html
title: "Docker 入门教程 - 阮一峰的网络日志"
host: ruanyifeng.com
```

## 概念

主要有两个概念：Image 和 Container

类比记忆：
- Image $\to$ 类
- Container $\to$ 实例

## Image

下载镜像
```bash
docker image pull [lib]/[image_name](:[tag])
```

列出镜像
```bash
docker image ls
```

删除镜像
```bash
docker image rm [image_name]
```
## Container

列出正在运行容器
```bash
docker container ls
```

列出所有容器
```bash
docker container ls --all
```

运行容器 (会自行 pull image)
```
docker container run [image_name] ([first_command])
```
额外参数：
- `-p [local_port]:[container_port]`：将 `container_port` 映射到 `local_port`
- `-it`：将容器 shell 映射到当前 shell
- `[first_command]`：进入容器的第一个指令，一般是 `/bin/bash`

终止容器
```bash
docker container kill [container_id]
```
kill 容器并不会删除容器文件

删除容器
```bash
docker container rm [container_id]
```

## DockerFile

![DockerFile](./DockerFile.md)


## 工作流

构建 image
```bash
docker build --network host -t <image_name>:<tag_name>
```

>[!note] docker build 参数
>- `--network host`：指定使用 host 代理
>- `-t <image_name>:<tag_name>`：指定标签

运行 container 并进入 shell
```bash
docker run -it --rm -P image_name:tag_name
```

>[!note] docker run 参数
>- `-it`：指定要 tty 环境
>- `--rm`：运行结束后自动删除 container
>- `-P`：暴露所有接口，无映射
>- `-p <host_port>:<image_port>`：指定端口映射

## Docker Compose

