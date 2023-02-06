local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", "<Cmd>nohlsearch<Bar>:echo<CR>", default_opts)
