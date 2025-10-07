---
title: 自定义 format
date: 2024-12-19T09:42:12+08:00
lastmod: 2025-08-30T16:13:54+08:00
publish: true
categories: C++
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

|Expression|Return type|Requirement|
|---|---|---|
|`g.parse(pc)`|`PC::iterator`|Parses format-spec ([format.string]) for type T in the range [pc.begin(), pc.end()) until the first unmatched character. Throws `format_error` unless the whole range is parsed or the unmatched character is }. Note: This allows formatters to emit meaningful error messages. Stores the parsed format specifiers in `*this` and returns an iterator past the end of the parsed range.|
|`f.format(t, fc)`|`FC::iterator`|Formats `t` according to the specifiers stored in `*this`, writes the output to `fc.out()` and returns an iterator past the end of the output range. The output shall only depend on `t`, `fc.locale()`, and the range `[pc.begin(), pc.end())` from the last call to `f.parse(pc)`.|

Where:

- `f` is a value of type (possibly `const`) F, (in other words: the `format` function should be a const member function)
- `g` is an lvalue of type F.

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
