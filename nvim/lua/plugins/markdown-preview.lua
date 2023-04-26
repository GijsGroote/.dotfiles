-- markdown preview
return {
  "iamcco/markdown-preview.nvim",
  keys = {
    { "<leader>md",  "<Cmd>MarkdownPreview<CR>", desc = "Markdown preview" },
  },

  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}


