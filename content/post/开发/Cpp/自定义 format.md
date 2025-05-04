---
title: 自定义 format
date: 2024-12-19T09:42:12+08:00
lastmod: 2025-04-30T21:56:00+08:00
publish: true
---

标准库 `<format>` 和 fmt 的定制 format 很像：

```cpp
// std::format
template <>
struct std::formatter<MyType> {
	// `parse(auto&& ctx)` to involve other formatters
    constexpr auto parse(std::format_parse_context& ctx) {
        return /* */;
    }

    auto format(const MyType& obj, std::format_context& ctx) const {
        return std::format_to(ctx.out(), /* */);
    }
};
```

```cpp
// fmt::format
template <>
struct fmt::formatter<point> { 
	constexpr auto parse(format_parse_context& ctx); 
	
	template <typename FormatContext>
	auto format(const point& p, FormatContext& ctx) const; 
};
```

>[!info] 吐槽
>妈的真的又比不过 rust 了。人家 rust 直接  `#[Derive(Debug)]` 就 ok 了😡😡
>
>虽然你这自由度是高，但是基本的 shortcut 也得有吧。。
>
>但是 C++26 static reflection 出来应该就会好了吧！！（确信
