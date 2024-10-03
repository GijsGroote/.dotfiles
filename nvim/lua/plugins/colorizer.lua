return {
    -- the colorscheme should be available when starting Neovim
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup({
                '*'; -- Apply colorizer to all files
            }, {
                mode = 'background'; -- Set mode to foreground for better performance
            })
        end,

        keys = {
            { "<leader>co", "<Cmd>ColorizerToggle<CR>", desc = "LazyGit" }
        }
    },
}
