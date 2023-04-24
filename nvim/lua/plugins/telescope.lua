-- telescope and other
return {

  -- fuzzy file search
  { "junegunn/fzf", run = "./install --bin" },

  -- plenary dependency for telescope
  {"nvim-lua/plenary.nvim"},
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>f",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },


  -- -- fuzzy search the citation file
  -- { "nvim-telescope/telescope-bibtex.nvim",
  -- dependencies = {
  --     {'nvim-telescope/telescope.nvim'},
  --   },
  --   config = function ()
  --     require"telescope".load_extension("bibtex")
  --   end,
  -- },

}
