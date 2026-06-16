local lspconfig = require("lspconfig")
local def = require("lsp.default-lsp")

lspconfig.omnisharp.setup({
  cmd = { "omnisharp" },
  settings = {
    omnisharp = {
      enableRoslynAnalyzers = true,
      enableEditorConfigSupport = true,
      organizeImportsOnFormat = true,
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    def.on_attach(client, bufnr)
  end,
  capabilities = def.capabilities,
})
