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

-- saving file
keymap('n', '<C-s>', '<Cmd>:w<CR>', default_opts)
keymap('i', '<C-s>', '<Esc><Cmd>:w<CR>', default_opts)

-- typing vy or vd is faster than yy or dd
keymap('n', 'vy', 'yy', default_opts)
keymap('n', 'vd', 'dd', default_opts)

keymap('n', '<leader>Q', '<Cmd>qall<CR>', default_opts)

keymap('n', '<leader>y', '"+y', default_opts)

-- TODO: Make this copy the current line
-- keymap("n", "<leader>y", '"*y :let @+=@*<CR>', default_opts)
keymap("n", "<leader>p", '"+p', default_opts)

-- idea make control-shift c and control shift v the global copy thingy
keymap("n", "<leader>y", '"*y :let @+=@*<CR>', default_opts)

-- keymap("v", "<C-S-c>", '"*y :let @+=@*<CR>', default_opts)
-- keymap("v", "<C-S>c", '"*y :let @+=@*<CR>', default_opts)

keymap("v", "<leader>y", '"*y :let @+=@*<CR>', default_opts)
keymap("v", "<leader>p", '"+p', default_opts)



