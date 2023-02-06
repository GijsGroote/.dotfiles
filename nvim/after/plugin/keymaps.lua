local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- TODO: create this stuff in which key thingy. 
-- toggle nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", "<Cmd>nohlsearch<Bar>:echo<CR>", default_opts)

-- fuzzy finder
keymap("n", "<leader>f", "<Cmd>Files<CR>", default_opts)

-- harpoon to navigate between multiple scripts 
keymap("n", "<leader>h", '<Cmd>lua require("harpoon.mark").add_file()<CR><Cmd>lua print("file harpooned!")<CR>' , default_opts)
keymap("n", "<leader>H", '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', default_opts)
keymap("n", "<leader>1", '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', default_opts)
keymap("n", "<leader>2", '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', default_opts)
keymap("n", "<leader>3", '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', default_opts)
keymap("n", "<leader>4", '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', default_opts)

-- quit every window without saving
-- keymap("n", "<leader>Q", "<Cmd>qall<CR>", default_opts)

-- highlight color difinition with that color
keymap("n", "<leader>c", '<Cmd>ColorHighlight<CR>', default_opts)
-- TODO: turn of color highlighting if they are turned on

-- Turn camelCase into snake_case
keymap("n", "<leader>sc", '<Cmd>lua require("config.custom_keymaps").snake_case()<CR>', default_opts)

-- newline without going into inseart mode
keymap("n", "m", "o<C-c>", default_opts)

-- split current line to this line (left from cursor) and next line (right from cursor)
keymap("n", "<leader>n", "i<CR><C-c>k$", default_opts)

-- JSON formatter
keymap("n", "<leader>j", "<Cmd>%!jq .<CR>$", default_opts)


-- turn on true zen mode
keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", default_opts)
keymap("n", "<leader>zm", "<Cmd>TZMinimalist<CR>", default_opts)
keymap("n", "<leader>za", "<Cmd>TZAtaraxis<CR>", default_opts)
keymap("n", "<leader>zq", "<Cmd>qa<CR>", default_opts)
keymap("n", "<leader>md", "<Cmd>MarkdownPreview<CR>", default_opts)

-- remove all trailing white space in file
keymap("n", "<leader>rw", "<Cmd>%s/\\s\\+$//e<CR>", default_opts)

-- popup fuzzy bibtex citation finder
keymap("n", "<leader>ci", "<Cmd>Telescope bibtex<CR>", default_opts)

