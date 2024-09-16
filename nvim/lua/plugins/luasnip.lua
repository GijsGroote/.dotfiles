-- LuaSnip
return {
  {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",

      -- fix this key snipper
    -- keys = {
    --     { "i", "<C-CR>", "v:lua.require'luasnip'.expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-CR>'", desc = "Expand Lua" }
    -- },

      config = function()
        require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/config/luasnip/"})
      end,
  }
}
