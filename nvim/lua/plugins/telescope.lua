-- telescope and other
return {

  -- sorter that prioritized file names over folder names
  {"natecraddock/telescope-zf-native.nvim"},

  -- plenary dependency for telescope
  {"nvim-lua/plenary.nvim"},

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { -- Lists files in your current working directory, respects .gitignore
        "<leader>ff",
        function() require("telescope.builtin").find_files() end,
        desc = "Find plugin file",
      },
      { -- Fuzzy search through the output of git ls-files command, respects .gitignore
        "<leader>fg",
        function() require("telescope.builtin").git_files() end,
        desc = "Fuzzy live grep",
      },
      { -- Searches for the string under your cursor or selection in your current working directory
        "<leader>fs",
        function() require("telescope.builtin").grep_string() end,
        desc = "Fuzzy grep string",
      },
      { -- Search for a string in your current working directory and get results live as you type, respects .gitignore.
        "<leader>fl",
        function() require("telescope.builtin").live_grep() end,
        desc = "Fuzzy live grep",
      },
      { -- Searches for the string under your cursor or selection in your current working directory
        "<leader>fb",
        function() require("telescope.builtin").buffers() end,
        desc = "Find buffers",
      },
      { -- Lists available help tags and opens a new window with the relevant help info on
        "<leader>fh",
        function() require("telescope.builtin").help_tags() end,
        desc = "Find help tags",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "ascending",
        winblend = 0,
      },

      pickers = {

        find_files = {
          theme = "dropdown",
        },
        buffers = {
          initial_mode = "normal",
        },
      },

      extensions = {
        { "natecraddock/telescope-zf-native.nvim"},
      },



      -- { "nvim-telescope/telescope.nvim", dependencies = "tsakirist/telescope-lazy.nvim" },
      -- { "natecraddock/telescope-zf-native.nvim"},

    }
  }
}
