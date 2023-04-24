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

  local n_keymap = {

    -- Turn camelCase into snake_case
    sc = { [[ <Cmd>lua require("config.custom_keymaps").snake_case()<CR> ]], "snake_case" },

    -- JSON formatter
    j = { [[ <Cmd>%!jq .<CR>$ ]], "JSON formatter" },

    -- true zen mode
    t = {
      name = "zen mode",
      m = {[[ <Cmd>TZMinimalist<CR> ]], "minimilist"},
      a = {[[ <Cmd>TZAtaraxis<CR> ]], "ataraxis"},
    },

    -- Markdown preview
    md = { [[ <Cmd>MarkdownPreview<CR> ]], "Markdown preview" },

    -- TODO: put this in .tex files only
    -- popup fuzzy bibtex citation finder
    ci = {[[ <Cmd>Telescope bibtex<CR> ]], "Fuzzy citation finder"},

    -- fuzzy finder
    -- f = { [[ <Cmd>Files<CR> ]], "Fuzzy Finder" },

    -- popup lazygit
    lg = { [[ <Cmd>LazyGit<CR> ]], "Lazy Git" },

    -- toggle nvim-tree
    e = {[[ <Cmd>NvimTreeToggle<CR> ]], "toggle NvimTree"},

    -- highlight color difinition with that color
    co = { [[ <Cmd>ColorHighlight<CR> ]], "highlight color" },
    -- TODO: turn of color highlighting if they are turned on

    -- harpoon to navigate between multiple scripts 
    h = { [[<Cmd>lua require("harpoon.mark").add_file()<CR><Cmd>lua print("file harpooned!")<CR>]], "harpoon file"},
    H = { [[ <Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR> ]], "Show harponed files"},
    ["1"] = { [[ <Cmd>lua require("harpoon.ui").nav_file(1)<CR> ]], "goto file 1"},
    ["2"] = { [[ <Cmd>lua require("harpoon.ui").nav_file(2)<CR> ]], "goto file 2"},
    ["3"] = { [[ <Cmd>lua require("harpoon.ui").nav_file(3)<CR> ]], "goto file 3"},
    ["4"] = { [[ <Cmd>lua require("harpoon.ui").nav_file(4)<CR> ]], "goto file 4"},

    -- yank (copy) and  paste from/to system clipboard
    y = { [[ "+y ]], "Yank to System Clipboard" },
    p = { [[ "+p ]], "Past from  System Clipboard" },
    P = { [[ "+P ]], "Past from  System Clipboard (before cursor)" },

  -- quit every window without saving
    Q = {[[ <Cmd>qall<CR> ]], "close without saving"},

    c = {
      name = "close",
      t = { [[ <Cmd> tabclose <CR> ]], "Close Tab" },
      a = { [[ <Cmd> qall <CR> ]], "Close All without saving" },
      x = { [[ <Cmd> xa <CR> ]], "Close and Save All" },
      -- todo: what to close next?
    },


    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    -- ["t"] = { "<cmd>ToggleTerm<CR>", "Terminal" },
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
    },

  }
  whichkey.register(n_keymap, opts)
end

local function visual_keymap()
  local v_keymap = {

    t = {
      name = "zen mode",
      m = {[[ <Cmd>TZMinimalist<CR> ]], "minimilist"},
      a = {[[ <Cmd>TZAtaraxis<CR> ]], "ataraxis"},
      n = { [[ :'<,'>TZNarrow<CR> ]], "highlight section only" },
    },

    y = { [[ "+y ]], "Yank to System Clipboard" },

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
