-- custom keymaps

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
keymap('x', '<leader>p', '"_dP"+y', default_opts)

-- saving file
keymap('n', '<C-s>', '<Cmd>:w<CR>', default_opts)
keymap('i', '<C-s>', '<Esc><Cmd>:w<CR>', default_opts)

-- typing vy or vd is faster than yy or dd
keymap('n', 'vy', 'yy', default_opts)
keymap('n', 'vd', 'dd', default_opts)

-- quit nvim
keymap('n', '<leader>Q', '<Cmd>qall<CR>', default_opts)


-- copy to global clipboard
keymap('n', '<leader>y', '"+y', default_opts)
keymap('v', '<leader>y', '"+y', default_opts)

-- past 
keymap('n', '<leader>p', '"_dp', default_opts)
keymap('v', '<leader>p', '"_dp', default_opts)

-- keymap('n', '<leader>y', "'*y :let @+=@*<CR>", default_opts)
-- keymap('v', '<leader>y', "'*y :let @+=@*<CR>", default_opts)

-- Move lines up/down with Alt+k and Alt+j
keymap('n', '<M-k>', ':m .-2<CR>==', default_opts)
keymap('n', '<M-j>', ':m .+1<CR>==', default_opts)
keymap('v', '<m-k>', ":m '<-2<cr>gv=gv", default_opts)
keymap('v', '<m-j>', ":m '>+1<cr>gv=gv", default_opts)
keymap('v', 'cn', '<Cmd>cnext<CR>', default_opts)

-- remove all trailing white space in file
keymap('n', '<leader>rw', ' <Cmd>:%s/\\s\\+$//e<CR>', default_opts)

