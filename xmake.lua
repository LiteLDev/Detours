add_rules("mode.debug", "mode.release")

if is_mode("debug") then
    set_runtimes("MDd")
else
    set_runtimes("MD")
end

target("detours")
    set_kind("static")
    set_languages("c++17")
    add_headerfiles("detours/src/*.h", { prefixdir = "detours" })
    add_includedirs("detours/src")
    add_files("detours/src/*.cpp")
    remove_files("detours/src/uimports.cpp") -- This file is included and not compiled on its own
