local M = {}

function M.get_random_art()

    math.randomseed(os.time())

    if math.random() < 0.2 then

        -- get text file names
        local i, ancii_names, popen = 0, {}, io.popen
        local pfile = popen('ls config/arts/ancii/')

        for ancii_name in pfile:lines() do
            if string.sub(ancii_name, -4) == ".txt" then
                i = i + 1
                ancii_names[i] = ancii_name
            end
        end
        pfile:close()

        -- choose a random ancii_name
        local ancii_path = "config/arts/ancii/"..tostring(ancii_names[math.random(2, #ancii_names)])
        local ancii = {''}
        local ancii_file = io.open(ancii_path, "r")


        if ancii_file then
            for line in ancii_file:lines() do
                table.insert(ancii, line)

            end
            ancii_file:close()
            table.insert(ancii, '')
        else
            print("Error: Could not open file " .. ancii_path)
        end


        return ancii

    else
        -- randomly select a quote
        local quotes = require("config.arts.quotes")
        local quote = quotes[math.random(1, #quotes)]

        local t = {'','','',''}
        for _, value in ipairs(quote) do
            table.insert(t, value)
            appendToFile('zoutput.txt', 'chioosing this'..value)
        end

        table.insert(t, '')
        table.insert(t, '')
        table.insert(t, '')

        return t
    end

end

function appendToFile(filename, text)
    -- Open the file in append mode
    local file = io.open(filename, "a")

    if file then
        -- Write the text to the file
        file:write(text .. "\n")

        -- Close the file
        file:close()
    else
        print("Error: Could not open file " .. filename)
    end
end


return M

