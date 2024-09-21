require "lspconfig"

local dap_virt_text = require("nvim-dap-virtual-text")
dap_virt_text.setup()
-- require("nvim-dap-virtual-text").setup()

local def = require "lsp.default-lsp"
local lspconfig = require "lspconfig"
local util = require 'lspconfig.util'

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
  '.git',
}
local function organize_imports()
  local params = {
    command = 'pyright.organizeimports',
    arguments = { vim.uri_from_bufnr(0) },
  }

  local clients = vim.lsp.get_active_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }
  for _, client in ipairs(clients) do
    client.request('workspace/executeCommand', params, nil, 0)
  end
end
local function set_python_path(path)
  local clients = vim.lsp.get_active_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }
  for _, client in ipairs(clients) do
    client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
    client.notify('workspace/didChangeConfiguration', { settings = nil })
  end
end
lspconfig.ruff_lsp.setup {
  capabilities = def.capabilities,
  on_attach = def.on_attach,
  default_config = {
    filetypes = { 'python' },
    single_file_support = true,
  },
}
lspconfig.pyright.setup {
  capabilities = def.capabilities,
  on_attach = def.on_attach,
  default_config = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname)
    end,
    single_file_support = true,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = 'openFilesOnly',
        },
      },
    },
  },
  commands = {
    PyrightOrganizeImports = {
      organize_imports,
      description = 'Organize Imports',
    },
    PyrightSetPythonPath = {
      set_python_path,
      description = 'Reconfigure pyright with the provided python path',
      nargs = 1,
      complete = 'file',
    },
  },
  docs = {
    description = [[
https://github.com/microsoft/pyright

`pyright`, a static type checker and language server for python
]],
  },
}


-- DAP for python
local dap = require "dap"
require("dap-python").setup("python")

local wk = require("which-key")

wk.add({
    group = "Debugger",
    name = "eDDDbugger",
    mode = { "n", "t" },
    { "<leader>dt", dap.terminate, desc = "Terminate Debugger" },
    {"<leader>dc",  dap.continue, desc = "Start/Continue Debugger" },
    { "<leader>dl", dap.run_last, desc = "Run Last Debug Session" },
    { "<leader>dk", dap.up, desc = "Go up the stacktrace" },
    { "<leader>dj", dap.down, desc = "Go down the stacktrace" },
    { "<leader>di", dap.step_into, desc = "Step into the current code." },
    { "<leader>do", dap.step_out, desc = "Step out of the current code." },
    { "<leader>db", dap.toggle_breakpoint, desc = 'Toggle Breakpiont'},
    { "<leader>B", dap.toggle_breakpoint, desc = 'Toggle Breakpiont'},
})

