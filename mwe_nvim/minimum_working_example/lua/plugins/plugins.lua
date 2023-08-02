-- this frle contains all the plugins that take just a few lines of code
return {

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      colorscheme = "gruvbox",
    },
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
