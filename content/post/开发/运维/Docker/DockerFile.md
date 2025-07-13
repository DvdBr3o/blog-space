---
title: DockerFile
date: 2025-01-25T16:05:10+08:00
lastmod: 2025-07-14T05:28:47+08:00
tags:
  - docker
publish: true
---

| 指令                                    | 作用                                      |
| ------------------------------------- | --------------------------------------- |
| `FROM ([lib]/)[container_name]:[tag]` | 指定基于某镜像                                 |
| `WORKDIR [workdir]`                   | 指定工作路径                                  |
| `ENV [envvar_key]=[envvar_val]`       | 指定环境变量                                  |
| `RUN [command]`                       | 执行命令                                    |
| `COPY [src] [dst]`                    | 将 dockerfile 所在路径下的 `src` 复制到容器中的 `dst` |
| `CMD [commad]`                        | 与 `RUN` 类似，但是只能 `CMD` 一次，且在最后           |
| `EXPOSE [port]`                       | 指定对外暴露接口                                |
## 多阶段

构建环境 & 可运行环境 可以是两个不同的环境

可以选用更精简的 FROM 作为可运行环境