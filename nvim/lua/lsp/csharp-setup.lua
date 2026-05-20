local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup({
  cmd = { "omnisharp" }, -- mason puts it on PATH automatically
  settings = {
    omnisharp = {
      enableRoslynAnalyzers = true,
      enableEditorConfigSupport = true,
      organizeImportsOnFormat = true,
    },
  },
  on_attach = function(client, bufnr)
    -- disable omnisharp's semantic tokens in favour of treesitter
    client.server_capabilities.semanticTokensProvider = nil

    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>f",  vim.lsp.buf.format, opts)
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
