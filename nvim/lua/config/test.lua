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
    val = require("config.ancii.ancii").get_random_ancii_art(),
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
    },
}

local footer = {
    type = "text",
    val = "",
    opts = {
        position = "center",
        hl = "Number",
    },
}

local leader = "SPC"

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
        button("e", "  New file", "<Cmd>ene <BAR> startinsert <CR>"),
        button("d", ".  Open Dotfiles", "<Cmd>e ~/.dotfiles/ <CR>"),
        button("c", "  Configuration", "<Cmd>n ~/.dotfiles/nvim/lua/plugins.lua <CR>"),
        button("b", "  Open .bashrc", "<Cmd>n ~/.bashrc <CR>"),
        button("q", "  Quit Neovim", "<Cmd>qa <CR>"),
        button("e", "  New file", "<cmd>ene <CR>"),
        button("SPC f h", "  Recently opened files"),
        button("SPC s l", "  Open last session"),
    },
    opts = {
        spacing = 1,
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

  --
  --     local function footer()
  --       -- Number of plugins
  --       local total_plugins = #vim.tbl_keys(packer_plugins)
  --       local datetime = os.date "%d-%m-%Y %H:%M:%S"
  --       local plugins_text =
  --       "   "
  --       .. total_plugins
  --       .. " plugins"
  --       .. "   v"
  --       .. vim.version().major
  --       .. "."
  --       .. vim.version().minor
  --       .. "."
  --       .. vim.version().patch
  --       .. "   "
  --       .. datetime
  --
  --       -- Quote
  --       local fortune = require "alpha.fortune"
  --       local quote = table.concat(fortune(), "\n")
  --
  --       return plugins_text .. "\n" .. quote
  --     end
  --
  --     dashboard.section.footer.val = footer()
  --
  --     dashboard.section.footer.opts.hl = "Constant"
  --     dashboard.section.header.opts.hl = "Include"
  --     dashboard.section.buttons.opts.hl = "Function"
  --     dashboard.section.buttons.opts.hl_shortcut = "Type"
  --     dashboard.opts.opts.noautocmd = true
  --
  --     alpha.setup(dashboard.opts)
  --     )
  --   end
  -- }



return {
    button = button,
    section = section,
    config = config,
    -- theme config
    leader = leader,
    -- deprecated
    opts = config,
}
