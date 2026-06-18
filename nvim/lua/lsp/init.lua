require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})


require('lsp.lsp-setup')
require('lsp.cmp')
require('lsp.dap')
-- require('lsp.rust-setup')
require('lsp.python-setup')
require('lsp.csharp-setup')

