local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = false,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
    },
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
  }

end

return M


