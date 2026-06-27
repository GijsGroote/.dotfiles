local def = require("lsp.default-lsp")
local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup {
  capabilities = def.capabilities,
  on_attach = def.on_attach,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
    },
  },
}
