local M = {}

function M.setup()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local dashboard = require "alpha.themes.dashboard"

  dashboard.section.header.val = require("config.ancii.ancii").get_random_ancii_art()
  dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", "<Cmd>ene <BAR> startinsert <CR>"),
    dashboard.button("d", ".  Open Dotfiles", "<Cmd>e ~/.dotfiles/ <CR>"),
    dashboard.button("c", "  Configuration", "<Cmd>n ~/.dotfiles/nvim/lua/plugins.lua <CR>"),
    dashboard.button("b", "  Open .bashrc", "<Cmd>n ~/.bashrc <CR>"),
    dashboard.button("q", "  Quit Neovim", "<Cmd>qa <CR>"),
  }

  local function footer()
    -- Number of plugins
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text =
      "   "
      .. total_plugins
      .. " plugins"
      .. "   v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. "   "
      .. datetime

    -- Quote
    local fortune = require "alpha.fortune"
    local quote = table.concat(fortune(), "\n")

    return plugins_text .. "\n" .. quote
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Constant"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Function"
  dashboard.section.buttons.opts.hl_shortcut = "Type"
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

return M
