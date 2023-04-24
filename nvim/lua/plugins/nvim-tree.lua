return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("config.nvimtree").setup()
    end,

    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },

  --  -- vimspector
  -- {
  -- "puremourning/vimspector",
  -- config = function()
  -- require("config.vimspector").setup()
  -- end,
  -- },

}
