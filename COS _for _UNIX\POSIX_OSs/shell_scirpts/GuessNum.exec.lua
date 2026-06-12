local function main()
    local lvl = 1
    local atmep  = 0
    print("WE|COME T0 GU33S TH3 NUMB3R!")
    math.randomseed(os.time())
    local res = math.random(0, 100)
    local run = true
    while (run) do
        
        print("COPY THIS -1 TO L3AV3!")
        local usrRes
        local usrQuit = -1
        io.write("3NT3R YOUR NUMB3R!: ")
        usrRes = tonumber(io.read())

        if (lvl == 1) then
            if (usrRes == usrQuit) then
                io.write(" DO YOU WANT TO L3AV3? (1 = I WANT TO L3AV3, 0 = I WANT TO CONTINU3):")
                local qres = tonumber(io.read())
                if (qres == 0) then
                    -- continue equivalent in Lua using a nested block or goto is possible, 
                    -- but here we just let the logic flow
                elseif (qres == 1) then
                    run = false
                    return
                end
            elseif (usrRes > res) then
                atmep = atmep + 1
                print("TOO BIG")
            elseif (usrRes < res) then
                atmep = atmep + 1
                print("TOO SMALL")
            elseif (usrRes == res) then
                lvl = lvl + 1
                print("YOU WON")
                print(string.format("YOU WON IN %d ATT3MPTS!", atmep))
                io.write("DO YOU WANT TO L3AV3? (1 = I WANT TO L3AV3, 0 = I WANT TO CONTINU3): ")
                local qRes = tonumber(io.read())
                if (qRes == 1) then
                    run = false
                    return
                else
                    res = math.random(0, 100)
                end  
            end
        end
    end
end

main()
