-- keymaps that do not contain the leader key as prefix
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", "<Cmd>nohlsearch<Bar>:echo<CR>", default_opts)

-- remove all trailing white space in file
keymap("n", "rw", "<Cmd>%s/\\s\\+$//e<CR>", default_opts)

-- newline without going into inseart mode
keymap("n", "m", "o<C-c>", default_opts)

-- split current line to this line (left from cursor) and next line (right from cursor)
keymap("n", "M", "i<CR><C-c>k$", default_opts)

keymap("n", "<leader>sp", "<Cmd>setlocal spell! spelllang=en_us<CR>", default_opts)


-- windows to close with "q"
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)

