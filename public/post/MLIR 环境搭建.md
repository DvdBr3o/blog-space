---
title: MLIR 环境搭建
date: 2026-03-19T16:19:40+08:00
lastmod: 2026-03-19T16:22:37+08:00
tags:
  - mlir
  - 编译
categories: 编译原理
publish: true
---

## 库

用 precompiled 吧小子，不得不说人家 python 包管理就是好用

```lua
package("mlir")
    on_install(function (package)
        import("lib.detect.find_tool")
        local python = assert(find_tool("python3") or find_tool("python"), "python not found!")

        os.vrunv(python.program, {
            "-m", "pip", "install",
            "mlir",
            "-f", "https://github.com/makslevental/mlir-wheels/releases/expanded_assets/latest",
            "-t", package:installdir(),
            "--upgrade"
        })

        package:add("includedirs", "mlir/include")
        package:add("linkdirs", "mlir/lib")
        package:add("bindirs", "mlir/bin")

        if package:is_plat("windows") then
            package:add("syslinks", "ntdll")
        end
    end)

rule("mlir.precompiled")
    add_deps("mlir.tblgen")
    on_load(function(target)
        target:set("runtimes", "MT")
        if is_plat("windows") then
            target:add("syslinks", "ntdll")
        end
    end)
    
rule("mlir.tblgen")
    set_extensions(".td")

    on_build_file(function(target, sourcefile, opt)
        import("lib.detect.find_program")
        import("lib.detect.find_package")
        import("core.project.depend")
        import("utils.progress")

        local mlir_bindirs = {
            path.join(target:pkg("mlir"):installdir(), "bin"),
            path.join(target:pkg("mlir"):installdir(), "mlir", "bin"),
        }
    
        local mlir_tblgen = assert(find_program("mlir-tblgen", {paths = mlir_bindirs}), "mlir-tblgen not found!")

        local targetfile = path.join(path.directory(path.absolute(sourcefile)), path.basename(sourcefile) .. ".h.inc")

        local includedirs = target:extraconf("rules", "mlir.tblgen", "includedirs") or { "src" }

        print("targetfile:  %s", targetfile)

        local configs = {
            "-gen-op-decls",
            "-I", path.join(target:pkg("mlir"):installdir(), "include"),
            "-I", path.join(target:pkg("mlir"):installdir(), "mlir", "include"),
        }
        for _, dir in ipairs(includedirs) do
            table.insert(configs, "-I")
            table.insert(configs, dir)
        end
        table.insert(configs, sourcefile)
        table.insert(configs, "-o")
        table.insert(configs, targetfile)

        depend.on_changed(function ()
            os.vrunv(mlir_tblgen, configs)
            progress.show(opt.progress, "${color.build.target} generating %s", targetfile)
        end, {files = {sourcefile}})

        target:add("headerfiles", targetfile)
        target:add("includedirs", path.directory(path.absolute(targetfile)))
    end)
```

用的时候

```lua
add_requires("mlir")

target("hello_mlir")
    set_languages("cxx20")
    add_rules("mlir.tblgen", {includedirs = {"src"}})
    add_rules("mlir.precompiled")

    add_packages("mlir")

    add_headerfiles("src/**.hpp")
    add_files("src/**.cpp")
    add_files("src/**.td")
    add_includedirs("src")
```

## 开发工具

1. vscode 下载 mlir 扩展
2. 设置 `mlir-lsp-server` 路径
3. 设置 `tblgen-lsp-server` 路径
	1. 设置 includedir `--tablegen-extra-dir=path/to/mlir/include`
