local current_os = os.getenv("OS") or ""

if string.find(current_os, "Windows") then
    os.execute("cls")
else
    os.execute("clear")
end