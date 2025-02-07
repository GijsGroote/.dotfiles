-- LuaSnip
-- return {
--   -- snippet plugin
--   "L3MON4D3/LuaSnip",
--
--   dependencies = "rafamadriz/friendly-snippets",
--   opts = { history = true, updateevents = "TextChanged,TextChangedI" },
--   config = function(_, opts)
--     require("luasnip").config.set_config(opts)
--     require("config.luasnip")
--   end,
-- }
return {
  "L3MON4D3/LuaSnip",
  dependencies = "rafamadriz/friendly-snippets",
  lazy = false,  -- Ensure it's always loaded
  opts = { history = true, updateevents = "TextChanged,TextChangedI" },
  config = function(_, opts)
    require("luasnip").config.set_config(opts)

    -- Load VSCode-style snippets (friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load your custom Lua snippets
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/config/snips" })

    -- Keybindings for snippet expansion and navigation
    vim.keymap.set({"i", "s"}, "<C-k>", function() require("luasnip").expand_or_jump() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-j>", function() require("luasnip").jump(-1) end, {silent = true})
  end,
}

