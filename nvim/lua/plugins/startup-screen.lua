-- Startup screen

return {

    {'goolord/alpha-nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
  
      -- Warning: long configuration function
      config = function() 
  
          local if_nil = vim.F.if_nil
  
          local default_terminal = {
              type = "terminal",
              command = nil,
              width = 69,
              height = 8,
              opts = {
                  redraw = true,
                  window_config = {},
              },
          }
  
          local default_header = {
              type = "text",
              val = "random ancii art?",
          -- require("config.ancii.ancii").get_random_ancii_art(),
              opts = {
                  position = "center",
                  hl = "Include",
                  -- wrap = "overflow";
              },
          }
  
  
          local leader = " "
  
          --- @param sc string
          --- @param txt string
          --- @param keybind string? optional
          --- @param keybind_opts table? optional
          local function button(sc, txt, keybind, keybind_opts)
              local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")
  
              local opts = {
                  position = "center",
                  shortcut = sc,
                  cursor = 5,
                  width = 50,
                  align_shortcut = "right",
                  hl_shortcut = "Keyword",
              }
              if keybind then
                  keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
                  opts.keymap = { "n", sc_, keybind, keybind_opts }
              end
  
              local function on_press()
                  local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
                  vim.api.nvim_feedkeys(key, "t", false)
              end
  
              return {
                  type = "button",
                  val = txt,
                  on_press = on_press,
                  opts = opts,
              }
          end
  
  
          local buttons = {
              type = "group",
              val = {
            -- todo fix thos buttons, they are nice
                  button("e", "  New File", "<Cmd>ene <BAR> startinsert <CR>"),
                  -- button("f", "󰈞  Find File", 'require("telescope.builtin").find_files()'),
                  button("d", ".  Open Dotfiles", "<Cmd>e ~/.dotfiles/ <CR>"),
                  button("c", "  Configuration", "<Cmd>n ~/.dotfiles/nvim/lua/plugins/plugins.lua <CR>"),
                  button("b", "  Open .bashrc", "<Cmd>n ~/.bashrc <CR>"),
                  button("q", "󰅙  Quit Neovim", "<Cmd>qa <CR>"),
                  -- button("h", "  Recent files", "<Cmd>Telescope oldfiles <CR>"),
              },
              opts = {
                  spacing = 1,
            hl = "Function",
            hl_shortcut = "Type",
              },
          }
  
          local stats = require("lazy").stats()
          local plugins_text =
            "  loaded "
            .. stats.count 
            .. " plugins - NeoVim v" 
            .. vim.version().major
            .. "."
            .. vim.version().minor
          .. "."
          .. vim.version().patch
  
          -- Quote
          local fortune = require "alpha.fortune"
          local quote = table.concat(fortune(), "\n")
  
          local footer = {
              type = "text",
              val = plugins_text .. "\n" .. quote,
              opts = {
                  position = "center",
                  hl = "Constant",
              },
          }
  
          local section = {
              terminal = default_terminal,
              header = default_header,
              buttons = buttons,
              footer = footer,
          }
  
          local config = {
              layout = {
                  { type = "padding", val = 2 },
                  section.header,
                  { type = "padding", val = 2 },
                  section.buttons,
                  section.footer,
              },
              opts = {
                  margin = 5,
              },
          }
  
        local alpha = require('alpha')
        alpha.setup(config)
  
  
        vim.api.nvim_create_autocmd("User", {
          pattern = "LazyVimStarted",
          callback = function()
  
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  
            -- print(' loaded in ',ms)
  
            local plugins_text =
            "  loaded "
            .. stats.count 
            .. " plugins in "
            .. ms 
            .. " ms  v" 
            .. vim.version().major
            .. "."
            .. vim.version().minor
            .. "."
            .. vim.version().patch
  
            local footer = {
              type = "text",
              val = plugins_text .. "\n" .. quote,
              opts = {
                position = "center",
                hl = "Constant",
              },
            }
  
            local section = {
              terminal = default_terminal,
              header = default_header,
              buttons = buttons,
              footer = footer,
            }
  
            local config = {
              layout = {
                { type = "padding", val = 2 },
                section.header,
                { type = "padding", val = 2 },
                section.buttons,
                section.footer,
              },
              opts = {
                margin = 5,
              },
            }
  
            local alpha = require('alpha')
            pcall(alpha.refresh)
  
          end,
        })
      end
    }
  }
  