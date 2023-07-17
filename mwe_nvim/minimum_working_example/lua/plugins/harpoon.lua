-- Harpoon

return {
  {
    "ThePrimeagen/harpoon",

    dependencies = {
      "nvim-lua/plenary.nvim", -- optional, for file icons
    },
    keys = {
      {
        "<leader>h",
        [[<Cmd>lua require("harpoon.mark").add_file()<CR><Cmd>lua print("file harpooned!")<CR>]],
        desc = "harpoon file",
      },
      { "<leader>H", [[ <Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR> ]], desc = "Show harponed files" },
      { "<leader>1", [[ <Cmd>lua require("harpoon.ui").nav_file(1)<CR> ]], desc = "goto file 1" },
      { "<leader>2", [[ <Cmd>lua require("harpoon.ui").nav_file(2)<CR> ]], desc = "goto file 2" },
      { "<leader>3", [[ <Cmd>lua require("harpoon.ui").nav_file(3)<CR> ]], desc = "goto file 3" },
      { "<leader>4", [[ <Cmd>lua require("harpoon.ui").nav_file(4)<CR> ]], desc = "goto file 4" },
    },
  },
}
