
return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
      config = function()
        require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/config/luasnip/"})
    end,
	build = "make install_jsregexp"
}

print
ll
kjsdfksdj
