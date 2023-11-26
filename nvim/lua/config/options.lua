-- Options are automatically loaded before lazy.nvim startup
-- find default options here: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local g = vim.g
vim.opt.path:append "/usr/bin/glow"
g.python3_host_prog = "/usr/bin/python3"
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
let g:pydocstring_doq_path = "/home/gijs/.local/bin/doq"
-- vim.cmd([[
--   let g:suda#nopass = 1
-- ]])

g.pydocstring_doq_path = "/home/gijs/.local/bin/doq"

-- close quickfix list after selecting option
vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = { "qf" },
    command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
  })
