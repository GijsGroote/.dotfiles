return {

  -- Colorscheme, TODO update this to what is in the startup plugin file
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
    disable = true,
  },


  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- highlight color definitions
  { "chrisbra/Colorizer" },

  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup()
    end,
  },


}
