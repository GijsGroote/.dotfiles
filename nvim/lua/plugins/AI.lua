        -- local home = vim.fn.expand("$HOME")
        -- return {
            --     "jackMort/ChatGPT.nvim",
            --     event = "VeryLazy",
            --     config = function()
                --         require("chatgpt").setup({
                    --             -- load ChatGPT API Key
                    --             api_key_cmd = "gpg --decrypt " .. home .. "/secret.txt.gpg"
                    --         })
                    --     end,
                    --     dependencies = {
                        --         "MunifTanjim/nui.nvim",
                        --         "nvim-lua/plenary.nvim",
                        --         "folke/trouble.nvim",
                        --         "nvim-telescope/telescope.nvim"
                        --     },
                        --     keys = {
                            --         { "<leader>sr", "<cmd>SudaRead<CR>", desc = "sudo read" },
                            --         { "<leader>sw", "<cmd>SudaWrite<CR>", desc = "sudo write" },
                            --     },
                            -- }

return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = true},
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },
}
