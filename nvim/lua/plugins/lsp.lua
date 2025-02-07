-- LSP

return {
  "ionide/Ionide-vim",
  "ray-x/lsp_signature.nvim",
  "ibhagwan/fzf-lua",
  "onsails/lspkind-nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    { -- optional completion source for require statements and module annotations
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },
    -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
  },
  "neovim/nvim-lspconfig",
  { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons", opts = {} },
  "hrsh7th/cmp-nvim-lsp-signature-help",
  {
    "hrsh7th/cmp-vsnip",
    dependencies = {
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",
    },
  },
  { "shortcuts/no-neck-pain.nvim", version = "*" },

  "leoluz/nvim-dap-go",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  "mfussenegger/nvim-dap-python",

  -- Snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "nvim-treesitter",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
  },
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",

  -- Programming
  "ii14/neorepl.nvim",
  "theHamsta/nvim-dap-virtual-text",
}
