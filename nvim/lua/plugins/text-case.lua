-- To change between snake_case, camelCase, PascalCase and kebab-case

return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    {"<leader>sc", ":lua require('textcase').current_word('to_snake_case')<cr>", desc = "to snake_case"},
    {"<leader>cc", ":lua require('textcase').current_word('to_camel_case')<cr>", desc = "to camelCase"},
  },
  lazy = false,
}
