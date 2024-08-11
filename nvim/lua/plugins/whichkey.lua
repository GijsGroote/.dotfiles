
return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300


      local wk = require("which-key")
      local conf = {
        win = {
          border = "single", -- none, single, double, shadow
          position = "bottom", -- bottom, top
        },
      }
      wk.setup(conf)
      wk.add({
        -- NORMAL mode mappings
        {
          mode = {"n"},
          -- yank (copy) and paste from/to system clipboard
          { "<leader>y", ' "+y ', desc = "Yank to System Clipboard", nowait = false, remap = false },
          { "<leader>P", ' "+P ', desc = "Paste from System Clipboard (before cursor)", nowait = false, remap = false },
          { "<leader>p", ' "+p ', desc = "Paste from System Clipboard", nowait = false, remap = false },

          { "<leader>Q", " <Cmd>qall<CR> ", desc = "close without saving", nowait = false, remap = false },
          { "<leader>b", group = "Buffer", nowait = false, remap = false },
          { "<leader>bD", "<Cmd>BWipeout other<Cr>", desc = "Delete All Buffers", nowait = false, remap = false },
          { "<leader>bc", "<Cmd>BDelete this<Cr>", desc = "Close Buffer", nowait = false, remap = false },
          { "<leader>bf", "<Cmd>BDelete! this<Cr>", desc = "Force Close Buffer", nowait = false, remap = false },

          -- highlight color difinition with that color
          { "<leader>co", " <Cmd>ColorHighlight<CR> ", desc = "highlight color", nowait = false, remap = false },
          -- JSON formatter
          { "<leader>j", " <Cmd>%!jq .<CR>$ ", desc = "JSON formatter", nowait = false, remap = false },
          -- remove all trailing white space in file
          { "<leader>rw", " <Cmd>:%s/\\s\\+$//e<CR> ", desc = "remove trailing whitespace", nowait = false, remap = false },
          -- Turn camelCase into snake_case
          { "<leader>sc", ' <Cmd>lua require("config.custom-keymaps").snake_case()<CR> ', desc = "snake_case", nowait = false, remap = false },
      },
      {
        -- VISUAL mode mappings
        mode = {"v"},
      { "<leader>y", ' "+y ', desc = "Yank to System Clipboard", mode = "v", nowait = false, remap = false },

      }
      })

    end,
  },
}
