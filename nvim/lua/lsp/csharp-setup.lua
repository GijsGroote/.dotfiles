local def = require("lsp.default-lsp")

return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
        on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil
            def.on_attach(client, bufnr)
        end,

        capabilities = def.capabilities,
    },
}
