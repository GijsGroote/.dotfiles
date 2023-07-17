-- this frle contains all the plugins that take just a few lines of code
return {

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "catppuccin",
      -- colorscheme = "gruvbox",
    },
  },

  -- git intergration
  {"kdheepak/lazygit.nvim",
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Lazy Git" } },
  },

  -- absolute and relative line numbering
  "sitiom/nvim-numbertoggle",

  -- Better Comment
  "tpope/vim-commentary",

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
