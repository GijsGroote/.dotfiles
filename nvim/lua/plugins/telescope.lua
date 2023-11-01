-- telescope and other
return {

  -- sorter that prioritized file names over folder names
  {"natecraddock/telescope-zf-native.nvim"},

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",

    -- plenary dependency for telescope
    dependencies = {"nvim-lua/plenary.nvim"},

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
    -- default looks
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "ascending",
        winblend = 0,
      },

      -- specify how fuzzy search looks, seperate find_files, git_files from live_grep etc.
      pickers = {
        buffers = { initial_mode = "normal", },
        find_files = { initial_mode = "insert", },
        git_files = { initial_mode = "insert", },
        grep_string = { initial_mode = "insert", },
        live_grep = { theme = "dropdown", },

      },

      extensions = {
        { "natecraddock/telescope-zf-native.nvim"},
      },



      -- { "nvim-telescope/telescope.nvim", dependencies = "tsakirist/telescope-lazy.nvim" },
      -- { "natecraddock/telescope-zf-native.nvim"},

    }
  }
}
