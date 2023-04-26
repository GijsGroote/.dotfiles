return {
  -- Vimtex for latex documents
  "lervag/vimtex",

  -- fuzzy search the citation file
  { "nvim-telescope/telescope-bibtex.nvim",
  dependencies = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function ()
      require"telescope".load_extension("bibtex")
    end,
  },
}
