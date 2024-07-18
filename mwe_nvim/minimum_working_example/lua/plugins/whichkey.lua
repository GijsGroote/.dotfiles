  -- whichkey
return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      -- local M = {}

      local whichkey = require "which-key"
      local next = next

      local conf = {
        window = {
          border = "single", -- none, single, double, shadow
          position = "bottom", -- bottom, top
        },
      }

      whichkey.setup(conf)

      local opts = {
        mode = "n", -- Normal mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
      }

      local v_opts = {
        mode = "v", -- Visual mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
      }


      local function normal_keymap()

        local n_keymap = {

          -- Turn camelCase into snake_case
          sc = { [[ <Cmd>lua require("config.custom_keymaps").snake_case()<CR> ]], "snake_case" },

          -- JSON formatter
          j = { [[ <Cmd>%!jq .<CR>$ ]], "JSON formatter" },

          -- highlight color difinition with that color
          co = { [[ <Cmd>ColorHighlight<CR> ]], "highlight color" },
          -- TODO: turn of color highlighting if they are turned on

          -- yank (copy) and  paste from/to system clipboard
          y = { [[ "+y ]], "Yank to System Clipboard" },
          p = { [[ "+p ]], "Past from  System Clipboard" },
          P = { [[ "+P ]], "Past from  System Clipboard (before cursor)" },

          -- quit every window without saving
          Q = {[[ <Cmd>qall<CR> ]], "close without saving"},

          b = {
            name = "Buffer",
            c = { "<Cmd>BDelete this<Cr>", "Close Buffer" },
            f = { "<Cmd>BDelete! this<Cr>", "Force Close Buffer" },
            D = { "<Cmd>BWipeout other<Cr>", "Delete All Buffers" },
          },
        }
        whichkey.register(n_keymap, opts)
      end

      local function visual_keymap()
        local v_keymap = {
          y = { [[ "+y ]], "Yank to System Clipboard" },

        }

        whichkey.register(v_keymap, v_opts)
      end

      local function code_keymap()
        if vim.fn.has "nvim-0.7" then
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
              vim.schedule(CodeRunner)
            end,
          })
        else
          vim.cmd "autocmd FileType * lua CodeRunner()"
        end

        --TODO: what does this do?
        function CodeRunner()
          local bufnr = vim.api.nvim_get_current_buf()
          local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
          local fname = vim.fn.expand "%:p:t"
          local keymap_c = {}

          if ft == "python" then
            keymap_c = {
              name = "Code",
              r = { "<cmd>update<CR><cmd>exec '!python3' shellescape(@%, 1)<cr>", "Run" },
              m = { "<cmd>TermExec cmd='nodemon -e py %'<cr>", "Monitor" },
            }
          elseif ft == "lua" then
            keymap_c = {
              name = "Code",
              r = { "<cmd>luafile %<cr>", "Run" },
            }
          elseif ft == "rust" then
            keymap_c = {
              name = "Code",
              r = { "<cmd>Cargo run<cr>", "Run" },
              D = { "<cmd>RustDebuggables<cr>", "Debuggables" },
              h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
              R = { "<cmd>RustRunnables<cr>", "Runnables" },
            }
          elseif ft == "go" then
            keymap_c = {
              name = "Code",
              r = { "<cmd>GoRun<cr>", "Run" },
            }
          elseif ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
            keymap_c = {
              name = "Code",
              o = { "<cmd>TSLspOrganize<cr>", "Organize" },
              r = { "<cmd>TSLspRenameFile<cr>", "Rename File" },
              i = { "<cmd>TSLspImportAll<cr>", "Import All" },
              R = { "<cmd>lua require('config.test').javascript_runner()<cr>", "Choose Test Runner" },
              s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" },
              t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" },
            }
          end

          if fname == "package.json" then
            keymap_c.v = { "<cmd>lua require('package-info').show()<cr>", "Show Version" }
            keymap_c.c = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
            keymap_c.s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" }
            keymap_c.t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" }
          end


          if next(keymap_c) ~= nil then
            whichkey.register(
            { c = keymap_c },
            { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>" }
            )
          end
        end
      end

      -- setup keymaps
      normal_keymap()
      visual_keymap()
      code_keymap()
    end,
  },
}
