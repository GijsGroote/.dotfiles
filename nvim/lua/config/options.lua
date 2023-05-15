-- Options are automatically loaded before lazy.nvim startup
-- find default options here: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
g.python3_host_prog = "/usr/local/bin/python3"
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0


-- close quickfix list after selecting option
vim.api.nvim_create_autocmd(
  "FileType", {
  pattern={"qf"},
  command=[[nnoremap <buffer> <CR> <CR>:cclose<CR>]]})

