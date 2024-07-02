-- keymaps that do not contain the leader key as prefix
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- turn highlighting off
keymap("n", "<ESC>", "<Cmd>nohlsearch<Bar>:echo<CR>", default_opts)

-- copy to global register TODO: this thingy, control shift y is preferred
-- keymap("n", "<C-S-y>", '<Cmd>"+yy<CR>', default_opts)
-- keymap("v", "<C-S-y>", '<Cmd>"+y<CR>', default_opts)

-- newline without going into inseart mode
keymap("n", "m", "o<C-c>", default_opts)

-- split current line to this line (left from cursor) and next line (right from cursor)
keymap("n", "M", "i<CR><C-c>k$", default_opts)

-- turn on spelling
keymap("n", "<leader>sp", "<Cmd>setlocal spell! spelllang=en_us<CR>", default_opts)

-- paste and keep yanked text in default buffer
keymap("x", "<leader>p", "\"_dP", default_opts)

keymap('n', "<leader>rn", "<cmd>lua vim.lsp.buf.rename() <cr>", default_opts)

-- windows to close with "q"
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)

-- typing vy or vd is faster than yy or dd
keymap("n", "vy", "yy", default_opts)
keymap("n", "vd", "dd", default_opts)

