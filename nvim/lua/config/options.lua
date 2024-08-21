
-- leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opt = vim.opt

-- Indentation
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.number = true

-- windows to close with 'q'
vim.api.nvim_create_autocmd(
  'FileType',
  { pattern = { 'help', 'startuptime', 'qf', 'lspinfo' }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
