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
            }
        }
      end,
keys = {
    { "<leader>e", [[ <Cmd>NvimTreeToggle<CR> ]], desc = "Open/Close Nvim Tree" },
  },
}
