require("mason").setup()
local lspconfig = require("mason-lspconfig")


local M = {}


function M.setup() 
  print("install the language servers ")

  lspconfig.setup {
  ensure_installed = {
    "texlab",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "lua_ls",
    "tsserver",
    "vimls",
    },

  }

end

return M
