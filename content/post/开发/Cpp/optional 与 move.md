---
title: optional 与 move
date: 2025-04-30T21:45:46+08:00
lastmod: 2025-04-30T21:49:34+08:00
tags:
  - cpp
  - optional
  - move
category: C++
publish: true
---

## move

```cardlink
url: https://wanghenshui.github.io/cppweeklynews/posts/182.html#beware-when-moving-a-stdoptional
title: "第182期"
description: "每周更新c++相关信息"
host: wanghenshui.github.io
```

```cpp
std::optional<T> opt = /* ... */;

// bad
auto x = std::move(opt.value());

// good
auto x = std::move(opt).value(); 
```

## rvo

```cardlink
url: https://wanghenshui.github.io/cppweeklynews/posts/182.html#beware-when-moving-a-stdoptional
title: "第182期"
description: "每周更新c++相关信息"
host: wanghenshui.github.io
```

```cpp
class LifeTime {
	int a_ = 0;
	public:
    LifeTime(int a):a_(a){
        std::cout << "LifeTime(): " << a_ << std::endl;
    }

    ~LifeTime() {
        std::cout << "~LifeTime(): " << a_ << std::endl;
    }

	LifeTime(const LifeTime&) {
        std::cout << "LifeTime(const LifeTime&): " << a_ << std::endl;
    }

	LifeTime(LifeTime&& other) noexcept {
		this->a_ = other.a_;
        std::cout << "LifeTime(LifeTime&&): " << a_ << std::endl;
    }

	LifeTime& operator=(const LifeTime&) {
        std::cout << "LifeTime& operator=(const LifeTime&): " << a_ << std::endl;
        return *this;
    }

	LifeTime& operator=(LifeTime&&) noexcept {
        std::cout << "LifeTime& operator=(LifeTime&&): " << a_ << std::endl;
        return *this;
    }
};

//break RVO
std::optional<LifeTime> create_v1() {
	LifeTime a{ 1 };
	return a;
}

//break RVO
std::optional<LifeTime> create_v2() {
	return LifeTime{2};
}

//break RVO
std::optional<LifeTime> create_v3() {
	std::optional<LifeTime> opt;
	opt = LifeTime{ 3 };
	return opt;
}

std::optional<LifeTime> create_v4() {
	std::optional<LifeTime> opt;
	opt.emplace(4);
	return opt;
}

std::optional<LifeTime> create_v5() {
	return std::optional<LifeTime>{5};
}

std::optional<LifeTime> create_v6() {
	return std::optional<LifeTime>{std::in_place, 6};
}
```
