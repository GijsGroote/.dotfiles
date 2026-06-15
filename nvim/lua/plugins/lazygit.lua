-- Fastest way in the galaxy to use Git.
return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "*lazygit*",
            callback = function()
                vim.opt_local.timeoutlen = 0
            end,
        })
    end,
}
