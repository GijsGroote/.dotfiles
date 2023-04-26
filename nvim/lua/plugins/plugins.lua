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

  -- Harpoon
  "ThePrimeagen/harpoon",

  -- ALE (Asynchronous Lint Engine)
  { "dense-analysis/ale" },

  -- Zen mode
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup({
        -- your config goes here
        -- or just leave it empty :)
      })
    end,
  },

  -- git intergration
  "kdheepak/lazygit.nvim",

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
