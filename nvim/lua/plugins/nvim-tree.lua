return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      view = {
        side = "right",
        width = 35,
      },
      filters = {
        dotfiles = false, -- Show hidden files (dotfiles)
        custom = {}, -- Do not filter any files
      },
      git = {
        ignore = false, -- Show files ignored by .gitignore
      },
    }
  end,
  keys = {
    { "<leader>e", [[ <Cmd>NvimTreeFindFileToggle<CR> ]], desc = "Open/Close Nvim Tree" },
  },
}

