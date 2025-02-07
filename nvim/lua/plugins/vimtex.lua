-- Latex plugin

return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  keys = {
      {"<localleader>lc", ":!latexmk -pvc -pdf %<CR>", desc = "continuous compilation"},
  },


  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0  -- Disable automatic quickfix list popup
  end
}
