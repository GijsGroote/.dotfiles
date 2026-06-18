-- Roslyn the microsoft open-source LSP.
local def = require("lsp.default-lsp")

vim.lsp.config("roslyn", {
  on_attach = def.on_attach,
  capabilities = def.capabilities,
})

require("roslyn").setup({})
