---
title: c89 file io
date: 2025-03-26T12:04:06+08:00
lastmod: 2025-12-29T20:46:50+08:00
tags:
  - c89
  - io
  - file
publish: true
---

```c
char buff[1000];
char chbuff;
int success;

// file_exists   true       false
// r             从头读      失败
// w             *销毁文件*  创建文件
// a             *销毁文件*  创建文件
// '+'同时赋予读/写能力
FILE* file = fopen("p/to/file.txt", "r+");
if (file == NULL) return;

// 读
success = fgets(buff, sizeof buff, file);
chbuff = fgetc(file);
fscanf(file, "%s", buff);

// 写
fputs("hello", file);
fputc('c', file);
fprintf(file, "hello world!\n");

// 定位
fpos_t* pos = NULL;
// 读
int posn = ftell(file); // 获取当前位置
fgetpos(file, pos);
// 写
rewind(file); // 回到开头
fseek(5, SEEK_SET); // 从开头数 5
fseek(5, SEEK_CUR); // 从当前数 5
fseek(5, SEEK_END); // 从末尾数 5
fsetpos(file, pos + 114514);

fclose(file);
```

>[!note] 读写函数 file 参数の位置
>1. 有变长参数包，如 `fscanf`/`fprintf`，参数 `file` 在开头
>2. 无变长参数包，如 `fputs` / `fgetc`，参数 `file` 在结尾