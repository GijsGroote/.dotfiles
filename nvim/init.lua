-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local api = vim.api
local g = vim.g
local opt = vim.opt

-- set current directory for fuzzy search
opt.path:remove "/usr/include"
opt.path:append "**"

-- Indentation
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.number = true

-- leaders
g.mapleader = " "
g.maplocalleader = " "

vim.opt.path:append "/usr/bin/glow"
g.python3_host_prog = "/usr/bin/python3"
g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

g.loaded_python3_provider = 0
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.pydocstring_doq_path = "/home/gijs/.local/bin/doq"

-- close quickfix list after selecting option
--vim.api.nvim_create_autocmd(
--  "FileType", {
--    pattern = { "qf" },
--    command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
--  })

require("config.lazy")



