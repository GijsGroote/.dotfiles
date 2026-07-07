local def = require("lsp.default-lsp")
local lspconfig = require("lspconfig")

lspconfig.qmlls.setup {
  capabilities = def.capabilities,
  on_attach = def.on_attach,
}
