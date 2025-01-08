local function find_last_space(input)
    for i = #input, 1, -1 do
        if string.sub(input, i, i) == " " then
            return i
        end
    end
    return nil
end

local function split_string(input, max_line_length)
    local result = {}
    local i = 1

    while i <= #input do
        -- Extract a substring of max_line_length characters
        local part = string.sub(input, i, i + max_line_length - 1)
        local last_space_index = find_last_space(part)
        if #part < max_line_length then
            local padding = string.rep(" ", max_line_length - #part)

            table.insert(result, part .. padding)
            i = i + max_line_length

        elseif last_space_index then
            local part_first = string.sub(part, 1, last_space_index)
            local padding = string.rep(" ", max_line_length - last_space_index)
            table.insert(result, part_first..padding)

            i = i + last_space_index
        else
            table.insert(result, part)
            i = i + max_line_length
        end
    end

    return result
end

local M = {}

function M.get_random_art()
    -- Return a randomly selected ancii art or a quote.

    math.randomseed(os.time())

    local current_file = debug.getinfo(1, "S").source:sub(2)
    local parent_dir = current_file:match("(.*/)[^/]+/[^/]+%.lua$")
    local arts_dir = parent_dir .. "arts/"

    if math.random() < 0.2 then

        -- get text file names
        local i, ancii_names, popen = 0, {}, io.popen
        local pfile = popen('ls ' .. arts_dir .. 'ancii/')

        for ancii_name in pfile:lines() do
            if string.sub(ancii_name, -4) == ".txt" then
                i = i + 1
                ancii_names[i] = ancii_name
            end
        end
        pfile:close()

        local ancii_path = arts_dir .. 'ancii/' .. tostring(ancii_names[math.random(2, #ancii_names)])

        local ancii = {''}
        local ancii_file = io.open(ancii_path, "r")

        local max_line_length = 0
        if ancii_file then
            for line in ancii_file:lines() do

                if #line > max_line_length then
                    max_line_length = #line
                end
                table.insert(ancii, line)
            end
            ancii_file:close()

            -- append whitespace to the back of the line
            for idx, value in ipairs(ancii) do
                if #value < max_line_length then
                    -- Calculate the number of spaces to add
                    local padding = string.rep(" ", max_line_length - #value)
                    -- Append the padding to the value
                    ancii[idx] = value .. padding
                end
            end

            table.insert(ancii, '')
        else
            print("Error: Could not open file " .. ancii_path)
        end


        return ancii
    else
        -- Combine both tables
        local all_quotes = {}
        for _, personal_quote in ipairs(require("config.arts.personal_quotes")) do
            table.insert(all_quotes, personal_quote)
        end

        -- for _, quote in ipairs(require("config.arts.quotes")) do
        --     table.insert(all_quotes, quote)
        -- end

        local quote = all_quotes[math.random(1, #all_quotes)]

        local max_line_length = 70
        local t = {'','',''}

        -- create table with quote
        for _, value in ipairs(quote) do

            if string.sub(value, 1, 1) == "-" then
                local padding = string.rep(' ', max_line_length - #value)
                table.insert(t, padding .. value)
            elseif #value < max_line_length then
                local padding = string.rep(' ', max_line_length - #value)
                table.insert(t, value .. padding)
            else
                local split_value = split_string(value, max_line_length)
                for _, sv in ipairs(split_value) do
                    table.insert(t, sv)
                end
            end

        end
        -- spacing below quote
        for _ = 1, 3 do
            table.insert(t, '')
        end

        return t
    end
end

return M
