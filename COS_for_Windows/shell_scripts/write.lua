

-- arg is a table containing all words typed after the command
if arg and #arg > 0 then
    -- Combine all arguments back together with spaces
    local output = table.concat(arg, " ")
    print("COS/write.exec> " .. output)
else
    -- Fallback if they just typed "write" with nothing else
    print("COS/write.exec> Error: Nothing to write. Usage: write [message]")
end