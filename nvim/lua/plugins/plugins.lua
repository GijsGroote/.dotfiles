-- this frle contains all the plugins that take just a few lines of code
return {

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      -- colorscheme = "gruvbox",
    },
  },

  -- ALE (Asynchronous Lint Engine)
  { "dense-analysis/ale" },

  -- git intergration
  {"kdheepak/lazygit.nvim",
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Lazy Git" } },
  },

  -- absolute and relative line numbering
  "sitiom/nvim-numbertoggle",

  -- Better Comment
  "tpope/vim-commentary",

  -- IndentLine
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
  },

 -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- footer line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

}
