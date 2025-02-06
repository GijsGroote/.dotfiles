-- Visualize HEX color codes and test different color formats
-- Rainbow color test list:
-- Red    - #FF0000
-- Orange - #FFA500
-- Yellow - #FFFF00
-- Green  - #00FF00
-- Blue   - #0080FF 
-- Indigo - #4B0082 
-- Violet - #EE82EE 

return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup({
                '*', -- Apply colorizer to all file types
                css = true, -- Enable support for rgb(), hsl(), and other CSS colors
                html = true, -- Support for HTML files
            })
        end,

        keys = {
            { "<leader>co", "<Cmd>ColorizerToggle<CR>", desc = "Toggle Colorizer" }
        }
    },
}
