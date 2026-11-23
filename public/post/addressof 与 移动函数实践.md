---
title: addressof 与 移动函数实践
date: 2024-12-21T00:17:14+08:00
lastmod: 2024-12-21T00:21:18+08:00
publish: true
categories: C++
---

```cardlink
url: https://en.cppreference.com/w/cpp/memory/addressof
title: "std::addressof - cppreference.com"
host: en.cppreference.com
```

`std::addressof` 用于获得真实地址，无视 `operator&` 的重载。

因此为了避免 `operator&` 重载问题，应该在移动函数判重中使用 `std::addressof`

```cpp
auto MyClass(Myclass&& another) noexcept {
	if (&another != this) { /* ... */ } // ill-formed

	if (std::addressof(another) != this) { // ok
		/* ... */
	}

	return *this;
}

auto operator=(Myclass&& another) noexcept { /* ... */ } // 同理
```
