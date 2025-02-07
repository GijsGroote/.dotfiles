-- Dependency functions for icons

return {
    { "nvim-tree/nvim-web-devicons", lazy = true },

    { 'echasnovski/mini.icons', version = false,
        config = function()
            require('mini.icons').setup()
        end,
    },
}
