---
title: 实现一个 C++ Unified Call
date: 2026-03-11T13:02:14+08:00
lastmod: 2026-03-11T17:59:32+08:00
slug: implement-cpp-unified-call
tags:
  - cpp
categories: C++
publish: true
---

https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2023/p3021r0.pdf

众所周知，C++ 有一篇被**否决**的 unified call syntax 提案，它允许形如 `foo(invoker, args...)` 的 free dispatch 定制直接以 `invoker.foo(args...)` 的形式调用. 但是由于虚函数以及普通函数重载等特性这项提案被否了，唉又差了人加 rust 一点...

但是 C++ 强就强在凡是语核语法糖缺失皆可元编程 mock 一下. 在 ranges 和 execution 的先例下我们有了 tag_invoke 和 pipeline operator 的小技巧. 以此我们可以简单 mock 一下这个 unified call.

## 实现

```cpp
template<typename InvokerT, typename TagT, typename... Args>
concept MemTagInvocable = requires(InvokerT invoker, Args&&... args) {
	std::forward<InvokerT>(invoker).tag_invoke(TagT(), std::forward<Args>(args)...);
};
template<typename InvokerT, typename TagT, typename... Args>
concept FreeTagInvocable = requires(InvokerT invoker, Args&&... args) {
	tag_invoke(TagT(), std::forward<InvokerT>(invoker), std::forward<Args>(args)...);
};

template<typename InvokerT, typename TagT, typename... Args>
concept MemTagInvocableOnly =
	MemTagInvocable<InvokerT, TagT, Args...> && !FreeTagInvocable<InvokerT, TagT, Args...>;
template<typename InvokerT, typename TagT, typename... Args>
concept FreeTagInvocableOnly =
	FreeTagInvocable<InvokerT, TagT, Args...> && !MemTagInvocable<InvokerT, TagT, Args...>;

template<typename InvokerT, typename TagT, typename... Args>
concept TagInvocableAmbiguously =
	MemTagInvocable<InvokerT, TagT, Args...> && FreeTagInvocable<InvokerT, TagT, Args...>;

template<typename InvokerT, typename TagT, typename... Args>
concept NoThrowMemTagInvocable = requires(InvokerT invoker, Args&&... args) {
	{ std::forward<InvokerT>(invoker).tag_invoke(TagT(), std::forward<Args>(args)...) } noexcept;
};
template<typename InvokerT, typename TagT, typename... Args>
concept NoThrowFreeTagInvocable = requires(InvokerT invoker, Args&&... args) {
	{ tag_invoke(TagT(), std::forward<InvokerT>(invoker), std::forward<Args>(args)...) } noexcept;
};

template<typename InvokerT, typename TagT, typename... Args>
concept TagInvocable =
	FreeTagInvocable<InvokerT, TagT, Args...> || MemTagInvocable<InvokerT, TagT, Args...>;

template<typename TagT, typename... Args>
struct UnifiedCallOpClosure : public std::tuple<Args&&...> {
	explicit constexpr UnifiedCallOpClosure(Args&&... args) :
		std::tuple<Args&&...> {std::forward<Args>(args)...} {}

	template<TagInvocableAmbiguously<TagT, Args...> InvokerT>
	inline friend constexpr auto operator|(
		InvokerT&& invoker, const UnifiedCallOpClosure& op
	) noexcept(NoThrowFreeTagInvocable<InvokerT, TagT, Args...>) {
		return std::apply(
			[&](auto&&... args) {
				return tag_invoke(
					TagT(),
					std::forward<InvokerT>(invoker),
					std::forward<Args>(args)...
				);
			},
			static_cast<const std::tuple<Args&&...>&>(op)
		);
	}

	template<FreeTagInvocableOnly<TagT, Args...> InvokerT>
	inline friend constexpr auto operator|(
		InvokerT&& invoker, const UnifiedCallOpClosure& op
	) noexcept(NoThrowFreeTagInvocable<InvokerT, TagT, Args...>) {
		return std::apply(
			[&](auto&&... args) {
				return tag_invoke(
					TagT(),
					std::forward<InvokerT>(invoker),
					std::forward<Args>(args)...
				);
			},
			static_cast<const std::tuple<Args&&...>&>(op)
		);
	}

	template<MemTagInvocableOnly<TagT, Args...> InvokerT>
	inline friend constexpr auto operator|(
		InvokerT&& invoker, const UnifiedCallOpClosure& op
	) noexcept(NoThrowMemTagInvocable<InvokerT, TagT, Args...>) {
		return std::apply(
			[&](auto&&... args) {
				return std::forward<InvokerT>(invoker).tag_invoke(
					TagT(),
					std::forward<Args>(args)...
				);
			},
			static_cast<const std::tuple<Args&&...>&>(op)
		);
	}
};

template<typename TagT>
struct UnifiedCallOp {
	template<typename InvokerT, typename... Args>
		requires TagInvocableAmbiguously<InvokerT, TagT, Args...>
	inline constexpr auto operator()(
		InvokerT&& invoker, Args&&... args
	) const noexcept(NoThrowFreeTagInvocable<InvokerT, TagT, Args...>) -> decltype(auto) {
		return tag_invoke(TagT(), std::forward<InvokerT>(invoker), std::forward<Args>(args)...);
	}

	template<typename InvokerT, typename... Args>
		requires FreeTagInvocableOnly<InvokerT, TagT, Args...>
	inline constexpr auto operator()(
		InvokerT&& invoker, Args&&... args
	) const noexcept(NoThrowFreeTagInvocable<InvokerT, TagT, Args...>) -> decltype(auto) {
		return tag_invoke(TagT(), std::forward<InvokerT>(invoker), std::forward<Args>(args)...);
	}

	template<typename InvokerT, typename... Args>
		requires MemTagInvocableOnly<InvokerT, TagT, Args...>
	inline constexpr auto operator()(
		InvokerT&& invoker, Args&&... args
	) const noexcept(NoThrowMemTagInvocable<InvokerT, TagT, Args...>) -> decltype(auto) {
		return std::forward<InvokerT>(invoker).tag_invoke(TagT(), std::forward<Args>(args)...);
	}

	template<typename... Args>
	inline constexpr auto operator()(Args&&... args) const noexcept
		-> UnifiedCallOpClosure<TagT, Args...> {
		return UnifiedCallOpClosure<TagT, Args...> {std::forward<Args>(args)...};
	}
};
```

## 使用

1. 定义定制点的 tag 类型 `tag_t`
2. 直接获得 unified call op
	`inline constexpr auto tag = UnifiedCallOp<tag_t>{};`
3. 定义被定制类型的 dispatch
	1. member dispatch
		`auto InvokerT::tag_invoke(tag_t, Args&&...);`
	2. free dispatch
		`auto tag_invoke(tag_t, InvokerT&&, Args&&...);`
		you know how ADL works right? either make it friend or in the same namespace!!
4. unified call !!!
	1. `tag(invoker, args...);`
	2. `invoker | tag(args...);`

>[!info] 开销
>你可能会担心 `tag(args...)` 生成对象会产生构造开销. 
>
>但实际上它存的全是引用 `Args&&...` 而且足够泛型，开了 O2 编译器可以直接把它内联成函数调用.

### free dispatch

>[!caution] 定制冲突时 free dispatch 优先
>如果同时存在 member dispatch 和 free dispatch，优先采用 free dispatch.
>
>因为 free dispatch 可以作为不修改类内部代码情况下的额外扩展手段. 如果 member dispatch 优先，那么如果要修改行为只能修改类的实现，违反软工原则！

支持 free dispatch 还有好处就是可以实现**主语 `invoker` 与定制方不一致**.

考虑这种场景，我们有 `RenderBackend` 和 `Renderable`.
- `RenderBackend` 是渲染引擎后端，持有渲染句柄，.e.g. `instance`, `device`.
- `Renderable` 则是待渲染的可渲染对象.

很明显根据开闭原则，我们应该把 `Renderable` 作为定制方，否则 `RenderBackend` 一开始就要写完所有 `Renderale` 的渲染定制，否则要改源码，这不可扩展.

但是 member dispatch 会让定制方和主语一致，而我们想要 `RenderBackend` 当主语对吧？
- ✅ `backend | render(renderable)`
- ❌ `renderable | render(backend)`

这时就可以用 free dispatch 替换主语，但是仍然在 `Renderable` 声明定制.

```cpp
struct Rectangle {
	int base_x;
	int base_y;
	int width;
	int height;
	
	inline friend constexpr auto tag_invoke(render_t, 
		const RenderBackend& backend, 
		const Rectangle& rect
	) {
		// logic...
	}
};

inline constexpr auto foo(Backend& backend) {
	Backend backend;
	Rectangle rect { 2006, 9, 0, 8 };
	backend | render(rect);
}
```

这已经肥肠接近 rust 的 impl trait 了，但是这更加松散，更加 duck typing...

所以美中不足就是太过 duck 导致智能提示完全不能给出你应该实现什么，事实上这里完全没有 trait 之类的约束...

### 例子

```cpp
struct draw_t {};

inline constexpr auto draw = UnifiedCallOp<draw_t> {};

struct Rectangle {
	auto tag_invoke(draw_t) const {
        std::cout << "mem!\n";
    }

    template<std::integral T>
    auto tag_invoke(draw_t, T&& t) const {
        std::cout << "template!\n";
    }

	auto tag_invoke(draw_t, int x, int y) const {
        std::cout << std::format("mem at {}, {}!\n", x, y);
    }

	inline friend auto tag_invoke(draw_t, const Rectangle& rect) {
        std::cout << "free!\n";
    }
};

inline constexpr auto foo() {
	Rectangle rect;
	rect | draw();  // mem dispatch 和 free dispatch 同时存在时
					// 优先采用 free dispatch
	rect | draw(1, 2);
	draw(rect);
    rect | draw(3); // 支持泛型参数
}

int main() {
    foo();
}
```

结果

```
free!
mem at 1, 2!
free!
template!
```

## 展望

这里只能实现静态多态，要像 rust 那样 trait / dyn trait 同时支持静态多态和动态多态还比较遥远，可以考虑如何跟 microsoft/proxy 对接，i ll tag a todo here...

- [ ] 对接 unified call 和 proxy 📅 2026-04-01 
