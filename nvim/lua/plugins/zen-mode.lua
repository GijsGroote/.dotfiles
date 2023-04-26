-- Zen mode

return {
  {
    "Pocco81/true-zen.nvim",

    keys = { 
      { "<leader>tm", "<Cmd>TZMinimalist<CR>", desc = "minimilist"},
      { "v","<leader>tm", "<Cmd>TZMinimalist<CR>", desc = "minimilist"},
      { "<leader>ta", "<Cmd>TZAtaraxis<CR>", desc = "ataraxis"},
    },

    config = function()
      require("true-zen").setup({
        -- your config goes here
        -- or just leave it empty :)
      })
    end,
  },
}
