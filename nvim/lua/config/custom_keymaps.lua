local M = {}

function M.snake_case()
    -- expand('<cword>') to get the current word under cursor
    local current_word = vim.call('expand','<cword>')

    -- change to snaek case
    local snake_case_word = current_word:gsub('%f[^%l]%u','_%1'):gsub('%f[^%a]%d','_%1'):gsub('%f[^%d]%a','_%1'):gsub('(%u)(%u%l)','%1_%2'):lower()

    -- replace word
    vim.cmd("normal! viws" ..  snake_case_word)
end

function M.to_object()

    vim.cmd("echo 'test'")

    vim.cmd("<Cmd>s/obstacles/objects/g<CR>")
    -- _cmds["singular"]= ":%s/obstacle/object/g"
    -- _cmds["Plural"]= ":%s/Obstacles/Objects/g"
    -- _cmds["Singular"]=  ":%s/Obstacle/Object/g"

end

return M


