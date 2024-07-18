return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    keys = {
      { "<leader>e", " <Cmd>NvimTreeToggle<CR>", desc = "Open Explorer" },
    },

    config = function()
      require("nvim-tree").setup({
        disable_netrw = false,
        hijack_netrw = true,
        view = {
          number = true,
          relativenumber = true,
          side = "right",
        },
        update_cwd = false,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
      })
    end,

  },
}
