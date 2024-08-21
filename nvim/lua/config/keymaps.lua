-- custom keymaps

local api = vim.api
local g = vim.g

-- keymaps that do not contain the leader key as prefix
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- turn highlighting off
keymap('n', '<ESC>', '<Cmd>nohlsearch<Bar>:echo<CR>', default_opts)

-- newline without going into insert mode
keymap('n', 'm', 'o<C-c>', default_opts)

-- split current line from cursor to newline
keymap('n', 'M', 'i<CR><C-c>k$', default_opts)

-- turn on spelling
keymap('n', '<leader>sp', '<Cmd>setlocal spell! spelllang=en_us<CR>', default_opts)

-- paste and keep yanked text in default buffer
keymap('x', '<leader>p', '\'_dP', default_opts)

-- TODO: this should be at the lsp
-- keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename() <cr>', default_opts)

-- save on control-s
keymap('n', '<C-s>', '<cmd>:w<cr>', default_opts)

-- typing vy or vd is faster than yy or dd
keymap('n', 'vy', 'yy', default_opts)
keymap('n', 'vd', 'dd', default_opts)

keymap('n', 'Q', '<Cmd>qall<CR>', default_opts)


