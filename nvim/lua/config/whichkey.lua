local M = {}

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
  local keymap_p = nil -- Project search

  local copy_past_mappings = {
    -- yank (copy) and  paste from/to system clipboard
    -- TODO: the visual mode versions
    y = { [[ "+y ]], "Yank to System Clipboard" },
    p = { [[ "+p ]], "Past from  System Clipboard" },
    P = { [[ "+P ]], "Past from  System Clipboard (before cursor)" },
  }
  whichkey.register(copy_past_mappings, v_opts)
  whichkey.register(copy_past_mappings, opts)

  local close_tab = {
    c = {
      name = "close",
      t = { [[ <Cmd> tabclose <CR> ]], "Close Tab" },
      a = { [[ <Cmd> qall <CR> ]], "Close All without saving" },
      x = { [[ <Cmd> xa <CR> ]], "Close and Save All" },
      -- todo: what to close next?
    }
  }
  
  whichkey.register(close_tab, opts)

  local keymap = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    -- ["t"] = { "<cmd>ToggleTerm<CR>", "Terminal" },
    --
    v = {
      name = "Vimspector",
      G = { "<cmd>lua require('config.vimspector').generate_debug_profile()<cr>", "Generate Debug Profile" },
      I = { "<cmd>VimspectorInstall<cr>", "Install" },
      U = { "<cmd>VimspectorUpdate<cr>", "Update" },
      R = { "<cmd>call vimspector#RunToCursor()<cr>", "Run to Cursor" },
      c = { "<cmd>call vimspector#Continue()<cr>", "Continue" },
      i = { "<cmd>call vimspector#StepInto()<cr>", "Step Into" },
      o = { "<cmd>call vimspector#StepOver()<cr>", "Step Over" },
      s = { "<cmd>call vimspector#Launch()<cr>", "Start" },
      t = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint" },
      u = { "<cmd>call vimspector#StepOut()<cr>", "Step Out" },
      S = { "<cmd>call vimspector#Stop()<cr>", "Stop" },
      r = { "<cmd>call vimspector#Restart()<cr>", "Restart" },
      x = { "<cmd>VimspectorReset<cr>", "Reset" },
      H = { "<cmd>lua require('config.vimspector').toggle_human_mode()<cr>", "Toggle HUMAN mode" },
    },

    b = {
      name = "Buffer",
      c = { "<Cmd>BDelete this<Cr>", "Close Buffer" },
      f = { "<Cmd>BDelete! this<Cr>", "Force Close Buffer" },
      D = { "<Cmd>BWipeout other<Cr>", "Delete All Buffers" },
    },

    c = {
      name = "Code",
      g = { "<cmd>Neogen func<Cr>", "Func Doc" },
      G = { "<cmd>Neogen class<Cr>", "Class Doc" },
      x = "Swap Next Param",
      X = "Swap Prev Param",
      -- f = "Select Outer Function",
      -- F = "Select Outer Class",
    },

    d = {
      name = "Debug",
    },

    p = keymap_p,

    t = {
      name = "Test",
      S = { "<cmd>UltestSummary<cr>", "Summary" },
      a = { "<cmd>Ultest<cr>", "All" },
      c = { "<cmd>UltestClear<cr>", "Clear" },
      d = { "<cmd>UltestDebug<cr>", "Debug" },
      f = { "<cmd>TestFile<cr>", "File" },
      l = { "<cmd>TestLast<cr>", "Last" },
      n = { "<cmd>TestNearest<cr>", "Nearest" },
      o = { "<cmd>UltestOutput<cr>", "Output" },
      s = { "<cmd>TestSuite<cr>", "Suite" },
      v = { "<cmd>TestVisit<cr>", "Visit" },
      p = { "<Plug>PlenaryTestFile", "PlenaryTestFile" },
    },

    r = {
      name = "Refactor",
      i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
      p = { [[ <Esc><Cmd>lua require('refactoring').debug.printf({below = false})<CR>]], "Debug Print" },
      c = { [[ <Esc><Cmd>lua require('refactoring').debug.cleanup({below = false})<CR>]], "Debug Cleanup" },
    },

    z = {
      name = "System",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
      x = { "<cmd>cd %:p:h<cr>", "Change Directory" },
      -- x = { "<cmd>set autochdir<cr>", "Auto ChDir" },
      e = { "!!$SHELL<CR>", "Execute line" },
      W = { "<cmd>SaveSession<cr>", "Save Workspace" },
      w = { "<cmd>Telescope session-lens search_session<cr>", "Restore Workspace" },
    },

  }
  whichkey.register(keymap, opts)
end

local function visual_keymap()
  local keymap = {

    r = {
      name = "Refactor",
      e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
      f = {
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function to File')<CR>]],
        "Extract Function to File",
      },
      v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], "Extract Variable" },
      i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
      r = { [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], "Refactor" },
      V = { [[ <Esc><Cmd>lua require('refactoring').debug.print_var({})<CR>]], "Debug Print Var" },
    },

    v = {
      name = "Vimspector",
      G = { "<cmd>lua require('config.vimspector').generate_debug_profile()<cr>", "Generate Debug Profile" },
      I = { "<cmd>VimspectorInstall<cr>", "Install" },
      U = { "<cmd>VimspectorUpdate<cr>", "Update" },
      R = { "<cmd>call vimspector#RunToCursor()<cr>", "Run to Cursor" },
      c = { "<cmd>call vimspector#Continue()<cr>", "Continue" },
      i = { "<cmd>call vimspector#StepInto()<cr>", "Step Into" },
      o = { "<cmd>call vimspector#StepOver()<cr>", "Step Over" },
      s = { "<cmd>call vimspector#Launch()<cr>", "Start" },
      t = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint" },
      u = { "<cmd>call vimspector#StepOut()<cr>", "Step Out" },
      S = { "<cmd>call vimspector#Stop()<cr>", "Stop" },
      r = { "<cmd>call vimspector#Restart()<cr>", "Restart" },
      x = { "<cmd>VimspectorReset<cr>", "Reset" },
      H = { "<cmd>lua require('config.vimspector').toggle_human_mode()<cr>", "Toggle HUMAN mode" },
    },
  }

  whichkey.register(keymap, v_opts)
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

function M.setup()
  normal_keymap()
  visual_keymap()
  code_keymap()
end

return M
