-- Startup screen
return {

  {'goolord/alpha-nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
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
			    button("e", "  New File", "<Cmd>ene <BAR> startinsert <CR>"),
			    -- button("f", "󰈞  Find File", 'require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })'),
          button("f", "󰈞  Find file"),
			    button("d", ".  Open Dotfiles", "<Cmd>e ~/.dotfiles/ <CR>"),
			    button("c", "  Configuration", "<Cmd>n ~/.dotfiles/nvim/lua/plugins/plugins.lua <CR>"),
			    button("b", "  Open .bashrc", "<Cmd>n ~/.bashrc <CR>"),
			    button("q", "󰅙  Quit Neovim", "<Cmd>qa <CR>"),
			    button("h", "  Recent files", "<Cmd>Telescope oldfiles <CR>"),
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
          .. " plugins in ? ms - NeoVim v" 
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

          print(' loaded in ',ms)

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


-- drop emoijs over the screen on special days
-- local drop_emoijs = false

-- This is for mondays but that is annoying and only tell that it is monday, you mostly know which day it is
-- (os.date("%A") == "Monday") 

-- if  
--   (os.date("%d/%m") == "27/09") or -- my birthday
--   (os.date("%d/%m") == "01/01") or -- dutch holidays
--   (os.date("%d/%m") == "07/04") or
--   (os.date("%d/%m") == "09/04") or
--   (os.date("%d/%m") == "10/04") or
--   (os.date("%d/%m") == "27/04") or
--   (os.date("%d/%m") == "05/05") or
--   (os.date("%d/%m") == "18/05") or
--   (os.date("%d/%m") == "28/05") or
--   (os.date("%d/%m") == "29/05") or
--   (os.date("%d/%m") == "25/12") or
--   (os.date("%d/%m") == "26/12") then
--   drop_emoijs = true 
-- end

-- if drop_emoijs then 
--   table.insert(startup_screen, { 
--     "folke/drop.nvim",
--     event = "VimEnter",
--     config = function()
--       local theme = ""

--       -- available themes "leaves", "snow", "stars", "xmas", "spring", "summer"
--       -- on moday make a theme depending on the season
--       -- if (os.date("%A") == "Monday") then

--       --   local currentMonth = tonumber(os.date("%m"))
--       --   if currentMonth >= 3 and currentMonth <= 5 then
--       --     theme = "spring"
--       --   elseif currentMonth >= 6 and currentMonth <= 8 then
--       --     theme = "summer"
--       --   elseif currentMonth >= 9 and currentMonth <= 11 then
--       --     theme = "leaves"
--       --   else
--       --     theme = "snow"
--       --   end
--       -- end

--       if (os.date("%d/%m") == "27/09") or -- TODO: make a birthday theme 
--         (os.date("%d/%m") == "01/01") or -- dutch holidays
--         (os.date("%d/%m") == "07/04") or
--         (os.date("%d/%m") == "09/04") or
--         (os.date("%d/%m") == "10/04") or
--         (os.date("%d/%m") == "27/04") or
--         (os.date("%d/%m") == "05/05") or
--         (os.date("%d/%m") == "18/05") then
--         theme = "stars"      
--       end

--       if (os.date("%d/%m") == "28/05") or
--         (os.date("%d/%m") == "29/05") then
--         theme = "xmax"      
--       end

--       require("drop").setup { theme = theme }

--     end,
  -- })
-- end

}
