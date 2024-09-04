-- Startup screen

return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup({
            theme = 'doom',
            config = {
                header = require("config.ancii.ancii").get_random_ancii_art(),
                center = {
                    {
                        icon = '📝',
                        desc = '  New File                              ',
                        -- desc_hl = 'Files',
                        key = 'n',
                        keymap = '',
                        -- key_hl = 'Number',
                        key_format = ' %s', -- remove default surrounding `[]`
                        action = function()
                            vim.cmd('ene')  -- opens a new file
                            vim.cmd('startinsert')  -- enters insert mode
                        end
                    },
                    {
                        icon = '🔍',
                        desc = '  Find File',
                        key = 'f',
                        keymap = '',
                        key_format = ' %s',
                        action = 'require("telescope.builtin").find_files()'
                    },
                    {
                        icon = '🌿',
                        desc = '  Recent Files',
                        key = 'r',
                        keymap = '',
                        key_format = ' %s',
                        action = 'Telescope oldfiles'
                    },
                    {
                        icon = '🔧',
                        desc = '  Open Dotfiles',
                        key = 'd',
                        keymap = '',
                        key_format = ' %s',
                        action = 'e ~/.dotfiles/'
                    },
                    {
                        icon = '</>',
                        desc = ' Open .bashrc',
                        key = 'b',
                        keymap = '',
                        key_format = ' %s',
                        action = 'n ~/.bashrc '
                    },
                    {
                        icon = '🚫',
                        desc = '  Quit',
                        -- desc_hl = 'Bye',
                        key = 'q',
                        keymap = '',
                        key_format = ' %s',
                        action = 'qa'
                    },


                },
                -- footer = {'footer'}  --your footer
            }
        })
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
