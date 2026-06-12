-- shell_scripts/python.lua
-- CUPS OS Interactive Python REPL Launcher

print("Launching Python 3 Sub-system for CUPS OS...")
print("Type 'exit()' or 'quit()' to return to CUPS OS.")
print("------------------------------------------------")

-- Launch python3 in interactive mode (-i)
-- This passes control of standard input/output directly to Python
os.execute("python3 -i")

print("------------------------------------------------")
print("Exited Python 3 Sub-system for CUPS OS. Returning to CUPS OS.")