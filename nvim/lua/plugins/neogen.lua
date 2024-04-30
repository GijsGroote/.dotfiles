-- Neogen, an Annotation generator for many many languages
return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "bash" },
  },
  keys = {
    { "<leader>nf", ":lua require('neogen').generate()<CR>", desc = "insert annatation" },
    { "<Tab>n", "<C-c>:lua require('neogen').jump_next()<CR>i", desc = "neogen: jump to next", mode="i" },
    { "<Tab>p", "<C-c>:lua require('neogen').jump_prev()<CR>i", desc = "neogen: jump to next", mode="i" },
  },

}

