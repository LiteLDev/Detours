target("detours")
    set_kind("static")
    set_languages("c++11")
    add_headerfiles("detours/src/*.h", { prefixdir = "detours" })
    add_includedirs("detours/src")
    add_files("detours/src/*.cpp")
    remove_files("detours/src/uimports.cpp") -- This file is included and not compiled on its own
    if is_mode("debug") then
        set_optimize("none")
        set_symbols("debug")
        add_cxflags("/MDd", "/Zi", "/Gy", "/Gm-", "/Zl")
    elseif is_mode("release") then
        set_optimize("fastest")
        set_symbols("hidden")
        add_cxflags("/MD", "/O2", "/Gy", "/Gm-", "/Zl")
    end
