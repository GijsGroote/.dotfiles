-- Neogen, an Annotation generator for many many languages
return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "bash" },
  },
  keys = {
    { "<leader>nf", ":lua require('neogen').generate()<CR>", desc = "insert annatation" },
  },

}

