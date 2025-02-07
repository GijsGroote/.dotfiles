-- Provide:
---- Language Parsers: install with TSInstall <language>
---- Queries: extracting information of the language tree
---- Modules: which provide top level features
-- 
-- for pretty much every coding language out there

return {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { "python" }, -- Add other languages as needed
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}
