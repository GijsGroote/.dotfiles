-- tree sitter, parse any programming language

return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  ensure_installed = { "pyright", "c", "lua", "vim", "vimdoc", "query" },

}
