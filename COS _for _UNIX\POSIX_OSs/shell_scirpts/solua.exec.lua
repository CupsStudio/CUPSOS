-- Helper Functions
function Write(...)
return print(...)
end

function Input()
return io.read()
end

function NumInput()
return tonumber(io.read())
end

-- Start the OS Loop
while true do
    -- Using Write to keep up consistency!
    Write("COS/solua.exec>?")
    local raw_input = Input()

    -- Guard clause: If the user just hits Enter, skip processing to avoid crashes
    if raw_input and raw_input:match("%S") then

        -- 1. Parse the input into a command and arguments
        local arg = {}
        for word in raw_input:gmatch("%S+") do
            table.insert(arg, word)
            end

            -- Extract the first word as the command
            local cmd = table.remove(arg, 1)

            -- 2. Command Router
            if cmd == "write" then
                if #arg > 0 then
                    local output = table.concat(arg, " ")
                    Write("COS/write.exec> " .. output)
                    if output 
                    else
                        Write("COS/write.exec> Error: Nothing to write. Usage: write [message]")
                        end

                        elseif cmd == "exit" then
                            -- Only ask to confirm when they explicitly want to leave
                            Write("Are you sure you want to shutdown? (y/n)")
                            repeat
                            local confirm = Input():lower() -- Converts to lowercase automatically
                            if confirm == "y" then
                                return
                                elseif confirm == "n" then
                                    break
                                    end
                                    -- It will keep looping until they type exactly 'y' or 'n'
                                    until false

                                    elseif cmd == "$-" then
					                    --
                                    elseif cmd == "input" then
                                        if #arg > 0 then
                                            local input = table.concat(arg, " ")
                                            Input(input)
                                            else
                                                Write("COS/solua.exec/input.exec> Error: Nothing to input. Usage: input [variable]")
                                                end
                                    elseif cmd == "@var" then
                                        Var = table.concat(arg, " ")
				                    else
                                        Write("syntax Error: Unknown command '" .. tostring(cmd) .. "'")
                                        end

                                        -- Add a tiny blank line space for visual clarity between commands
                                        Write("")
                                        end
                                        end
