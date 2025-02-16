-- Color scheme for the NVIM setup

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#FB508F', bold=true })
end

return {
    -- the colorscheme should be available when starting Neovim
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme tokyonight-night]])
            vim.cmd([[colorscheme tokyonight-storm]])
            -- vim.cmd([[colorscheme tokyonight-day]])
            -- vim.cmd([[colorscheme tokyonight-moon]])
            -- vim.cmd([[colorscheme tokyonight]])
            -- vim.cmd([[colorscheme habamax]])
            LineNumberColors()
        end,
    },

        {
        -- Rose-pine - Soho vibes for Neovim
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            dark_variant = "main"
        }
    },

}

