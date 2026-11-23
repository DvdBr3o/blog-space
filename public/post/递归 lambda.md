---
title: 递归 lambda
date: 2026-06-02T12:41:05+08:00
lastmod: 2026-06-02T12:54:45+08:00
tags:
  - cpp
publish: true
---

要 explicitly 传入自己，本质 y combinator

```cpp
constexpr auto fibo = [](auto&& self, int n) {
    if (n <= 1) return 1;
    else return self(self, n - 1) + self(self, n - 2);
};

int main() {
    constexpr auto comptime_ans = fibo(fibo, 10);
    auto dynatime_ans = fibo(fibo, 10);
    static_assert(comptime_ans == 89);
    std::println("comptime_ans = {}", comptime_ans); // 89
    std::println("dynatime_ans = {}", dynatime_ans); // 89
}
```

with c++23 deducing this 我们可以把 `self(self, args...)` 优雅地写成 `self(args...)`

```cpp
constexpr auto fibo = [](this auto&& self, int n) {
    if (n <= 1) return 1;
    else return self(n - 1) + self(n - 2);
};

int main() {
    constexpr auto comptime_ans = fibo(10);
    auto dynatime_ans = fibo(10);
    static_assert(comptime_ans == 89);
    std::println("comptime_ans = {}", comptime_ans); // 89
    std::println("dynatime_ans = {}", dynatime_ans); // 89
}
```

>[!hint] Insight
>这样我们就可以在复杂的模板元编程中实现零开销的递归
>
>在传统的元编程中，我们在运行期初始化 ast-like 对象并用函数指针实现递归，但是这样带来几个问题：
>
>1. 运行期初始化 overhead
>2. 指针跳转和存储开销
>3. 无法内联
>4. 无法尾递归优化
>
>但是用 constexpr recursive lambda 实现递归就可以做到零开销，让编译器最大限度的介入优化
>
>目前在 pars 里的不动点匹配规则 `FixRule` 用的就是这个思路