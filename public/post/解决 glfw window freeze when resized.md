---
title: 解决 glfw window freeze when resized
date: 2025-03-29T13:07:04+08:00
lastmod: 2025-07-04T20:31:02+08:00
tags:
  - graphics
  - window
  - glfw
categories: Graphics
publish: true
---

## 问题

至少在 windows 下，glfw window 在 resize 时整个窗口会停止渲染，直到 resize 结束

## 分析

```cardlink
url: https://www.reddit.com/r/vulkan/comments/8334de/example_for_swapchain_recreation_while_resizing/
title: "Reddit - The heart of the internet"
host: www.reddit.com
```

windows 下的 event loop 在 window resize 时会阻塞，体现在 `glfwPollEvents()` 也阻塞了

## 方案

要把 render 和 window event loop 放在不同的线程，防止阻塞

### Opengl

```cpp
#include <glad/gl.h>
#include <GLFW/glfw3.h>

#include <atomic>
#include <jthread>

struct Size {
	int width;
	int height;
}

GLFWwindow* window;
std::atomic<bool> _framebuffer_resized = false;

auto get_size(GLFWwindow* window) -> Size {
	int width;
	int height;
	glfwGetWindowSize(window, &width, &height);
	return { width, height };
} 

auto resize_framebuffer(GLFWwindow* window) -> void {
	const auto size = get_size(window);
	glViewport(0, 0, size.width, size.height);
}

int main() {
	GLFWwindow* window = glfwCreateWindow(800, 600, "title", nullptr, nullptr);
	gladLoadGLES2(glfwGetProcAddress);
	
	std::jthread render_thread { [&] {
		glfwMakeContextCurrent(window);
		resize_framebuffer(window);
		while(!glfwWindowShouldClose(window)) {
			if (_framebuffer_resized) {
				resize_framebuffer(window);
				_framebuffer_resized = false;
			}
			glfwSwapbuffers(window);
		}
	} };

	while(!glfwWindowShouldClose(window))
		glfwPollEvents();
}
```

### Vulkan
