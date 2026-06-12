-- shell_scripts/sysinfo.lua
print("COS/sysinfo.exec> --- CUPS OS Properties ---")
print("COS/sysinfo.exec> Kernel Architecture: C / Lua Embedded")
print("COS/sysinfo.exec> Host Time: " .. os.date())
print("COS/sysinfo.exec> Host OS Environment: " .. (os.getenv("OS") or "POSIX Compatible"))