-- Language Server Protocols, and every dependency

return {
  -- add any tools you want to have installed below
  -- Manage LSP server, DAP servers, linters and formatters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

}
