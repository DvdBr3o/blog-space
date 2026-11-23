---
title: emdawn xmake 打包
date: 2026-03-06T14:48:25+08:00
lastmod: 2026-03-06T15:06:04+08:00
tags:
  - dawn
  - webgpu
  - emscripten
  - xmake
categories: 图形学
publish: true
---

>[!info] 声明
> in most case 渲染引擎没有在已分发的 user 环境编译一遍的 chance，so use precompiled graphics api lib 未尝不可. 当然这里讨论 `emdawn`，那 compile 问题就不大，只不过在 windows/macos/linux 等 native 环境这里用了 precompiled dawn.

path constructure:

```
 dawn
├──  emdawn.xmake.lua
└──  xmake.lua
```

其中 `emdawn.xmake.lua` 作为给 `emdawnwebgpu` 适配 xmake package 的临时文件，复制到源码下再 `xmake build` + `xmake install` 实现 package install。而 `xmake.lua` 则提供该包的主要声明

```lua
-- emdawn.xmake.lua
target("emdawn")
    set_languages("cxx20")
    set_kind("static")
    add_files("webgpu/src/**.cpp")
    add_installfiles("webgpu/src/**.js", {prefixdir = "lib"})
    add_headerfiles("webgpu/include/**.h")
    add_headerfiles("webgpu_cpp/include/**.h")
    add_includedirs("webgpu/include")
    add_includedirs("webgpu_cpp/include")

    add_ldflags("--closure=1")
    add_ldflags("--js-library=webgpu/src/library_webgpu_enum_tables.js")
    add_ldflags("--js-library=webgpu/src/library_webgpu_generated_sig_info.js")
    add_ldflags("--js-library=webgpu/src/library_webgpu_generated_struct_info.js")
    add_ldflags("--js-library=webgpu/src/library_webgpu.js", {force = true})
    add_ldflags("--closure-args=--externs=webgpu/src/webgpu-externs.js")

    -- enable webgpu support
    -- add_cxflags("-sUSE_WEBGPU=1")
    add_ldflags("-sUSE_WEBGPU=1")

    -- enable async
    add_ldflags("-sASYNCIFY", {force = true})

    add_defines("WGPU_IMPLEMENTATION")
    add_defines("DAWN_ENABLE_BACKEND_WGPU")
```

```lua
-- xmake.lua
package("dawn")
    set_homepage("https://github.com/google/dawn")
    set_description("Dawn is an open-source implementation of WebGPU")

    if is_plat("windows") then
        if is_mode("release") then
	add_urls("https://github.com/google/dawn/releases/download/v20260304.163533/Dawn-31cd9c3331648e600286538f22899e650f7f3cb3-windows-latest-Release.tar.gz", {verify = false})
            add_versions("20260304.163533", "1ba1e7064c90f6f4848db6f005a3077e26dbc640ac6bb292b01135ec551c6c83")
        elseif is_mode("debug") then
		add_urls("https://github.com/google/dawn/releases/download/v20260304.163533/Dawn-31cd9c3331648e600286538f22899e650f7f3cb3-windows-latest-Debug.tar.gz", {verify = false})
            add_versions("20260304.163533", "e1431ef8906b6dd50155ad54e8865d3fea3ffb1e2157a75f28c1e393ca005d35")
        end
    elseif is_plat("linux") then
        if is_mode("release") then
		        add_urls("https://github.com/google/dawn/releases/download/v20260304.163533/Dawn-31cd9c3331648e600286538f22899e650f7f3cb3-ubuntu-latest-Release.tar.gz")
            add_versions("20260304.163533", "2d2eeb2697ef5ec529f41847ef3694c5d0b4b917ebcc1cee09f9f4ed855abe7d")
        elseif is_mode("debug") then
			add_urls("https://github.com/google/dawn/releases/download/v20260304.163533/Dawn-31cd9c3331648e600286538f22899e650f7f3cb3-ubuntu-latest-Debug.tar.gz")
            add_versions("20260304.163533", "4d27021659a1be8cefadd02f976a44d06e79b9c22abb48e77e43088f947676ef")
        end
    elseif is_plat("wasm") then
		    add_urls("https://github.com/google/dawn/releases/download/v20260304.163533/emdawnwebgpu_pkg-v20260304.163533.zip")
        add_versions("20260304.163533", "02eaaf23ae76c91191eebc5810eaefee388c12e63c753f28e3ef999ac15eac9e")
    end

    on_install("windows", "linux", function (package)
        os.cp("bin", package:installdir())
        os.cp("include", package:installdir())
        os.cp("lib", package:installdir())

        package:add("bindirs", "bin")
        package:add("linkdirs", "bin")
        package:add("includedirs", "include")
        package:add("linkdirs", "lib")

    end)
    on_install("wasm", function (package)
        os.cp(path.join(os.scriptdir(), "emdawn.xmake.lua"), "xmake.lua")

        import("package.tools.xmake").install(package)

        os.cp("webgpu", package:installdir())
        os.cp("webgpu_cpp", package:installdir())
        package:add("includedirs", path.join("webgpu", "include"))
        package:add("includedirs", path.join("webgpu_cpp", "include"))

        local lib_dir = package:installdir("lib")
        local js_files = {
            "library_webgpu_enum_tables.js",
            "library_webgpu_generated_sig_info.js",
            "library_webgpu_generated_struct_info.js",
            "library_webgpu.js"
        }

        local flags = {}
        for _, jsfile in ipairs(js_files) do
            table.insert(flags, "--js-library=" .. path.join(lib_dir, jsfile))
        end

        local externs_path = path.join(lib_dir, "webgpu-externs.js")
        table.insert(flags, "--closure-args=--externs=" .. externs_path)
  
        -- why `table.concat`?
        -- because single ldflag `--js-libray=library_webgpu.js` will fail and
        -- be ignored by xmake (it depends other js lib), the all `--js-library`
        -- flag must be passed at once.
        package:add("ldflags", table.concat(flags, " "), {force = true})

        package:add("ldflags", "-sASYNCIFY=1")
        package:add("ldflags", "-sJSPI=1")

    end)
```