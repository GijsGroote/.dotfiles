return {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { "python" }, -- Add other languages as needed
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}
