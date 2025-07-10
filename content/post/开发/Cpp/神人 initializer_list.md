---
title: 神人 initializer_list
date: 2025-07-10T23:29:15+08:00
lastmod: 2025-07-10T23:34:11+08:00
tags:
  - initializer_list
  - stl
  - cpp
categories: C++
publish: true
---

```cardlink
url: https://tristanbrindle.com/posts/beware-copies-initializer-list
title: "Beware of copies with std::initializer_list!"
description: "Pop quiz: what does the following C++ program do?"
host: tristanbrindle.com
```

没错，`std::initializer_list` 竟然沟槽的强制 copy

只能 move 的类型只能 get out of the way

## 解决办法

函数 + 模板，做类似 `make_xxx`

```cpp
template<typename... Ts>
auto foo(Ts&&... ts) {
	sizeof...(Ts);                      // ~ initializer_list.size()
	((bar(std::forward<Ts>(ts))), ...); // ~ for ... in initializer_list
}
```

美中不足就是没法 trailing comma，希望 C++26 静态反射之后可以改善 🙏🙏🙏
