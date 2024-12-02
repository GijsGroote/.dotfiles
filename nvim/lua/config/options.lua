local opt = vim.opt

-- leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Indentation
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.number = true

-- windows to close with 'q'
vim.api.nvim_create_autocmd(
  'FileType',
  { pattern = { 'help', 'startuptime', 'qf', 'lspinfo' }, command = [[nnoremap <buffer><silent> q :close<CR>]] })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})


vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.opt.clipboard="unnamedplus"


-- vimtex/latex stuff
vim.g.vimtex_compiler_method = 'latexrun'
