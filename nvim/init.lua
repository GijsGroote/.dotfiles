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
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.number = true


-- leaders
g.mapleader = " "
g.maplocalleader = " "

-- set python and ignore proders
-- g.python3_host_prog = "/usr/local/bin/python3"
-- g.loaded_perl_provider = 0
-- g.loaded_python3_provider = 0

-- setup all plugins in lua/plugins directory
require("lazy").setup('plugins')
