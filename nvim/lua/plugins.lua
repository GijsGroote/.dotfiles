
local M = {}

function M.setup()

  -- install lazy
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- leaders
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

 require("lazy").setup({

    -- -- Colorscheme
    -- {
    --   "folke/tokyonight.nvim",
    --   config = function()
    --     vim.cmd "colorscheme tokyonight"
    --   end,
    --   disable = false,
    -- },
    -- {
    --   "sainnhe/everforest",
    --   config = function()
    --     vim.g.everforest_better_performance = 1
    --     vim.cmd "colorscheme everforest"
    --   end,
    --   disable = true,
    -- },
    -- {
    --   "arcticicestudio/nord-vim",
    --   config = function()
    --     vim.cmd "colorscheme nord"
    --   end,
    --   disable = true,
    -- },
    -- {
    --   "norcalli/nvim-colorizer.lua",
    --   cmd = "ColorizerToggle",
    --   config = function()
    --     require("colorizer").setup()
    --   end,
    -- },
    --
    -- -- Startup screen
    -- {
    --   "goolord/alpha-nvim",
    --   config = function()
    --     require("config.alpha").setup()
    --   end,
    -- },
    --
    -- -- absolute and relative line numbering
    -- { "sitiom/nvim-numbertoggle" },
    --
    -- -- vimspector
    -- {
    --   "puremourning/vimspector",
    --   config = function()
    --     require("config.vimspector").setup()
    --   end,
    -- },
    --
    -- -- Vimtex for latex documents
    -- {'lervag/vimtex'},
    --
    -- -- fuzzy search the citation file
    -- { "nvim-telescope/telescope-bibtex.nvim",
    -- dependencies = {
    --     {'nvim-telescope/telescope.nvim'},
    --   },
    --   config = function ()
    --     require"telescope".load_extension("bibtex")
    --   end,
    -- },
    --
    -- -- Better Comment
    -- {
    --   "numToStr/Comment.nvim",
    --   opt = true,
    --   keys = { "gcc", "gbc" },
    --   config = function()
    --     require("Comment").setup {}
    --   end,
    -- },
    --
    -- -- IndentLine
    -- {
    --   "lukas-reineke/indent-blankline.nvim",
    --   event = "BufEnter",
    --   config = function()
    --     require("config.indentblankline").setup()
    --   end,
    -- },
    --
    -- {
    --   "kyazdani42/nvim-tree.lua",
    --   dependencies = {
    --     "kyazdani42/nvim-web-devicons", -- optional, for file icons
    --   },
    --   config = function()
    --     require("config.nvimtree").setup()
    --   end,
    --
    --   tag = "nightly" -- optional, updated every week. (see issue #1193)
    -- },
    --
    -- -- fuzzy file search
    -- "junegunn/fzf.vim",
    -- {
    --   "ibhagwan/fzf-lua",
    --   dependencies = { "kyazdani42/nvim-web-devicons" },
    -- },
    --
    -- -- -- LSP
    -- -- {
    -- --   "williamboman/mason.nvim",
    -- --   "williamboman/mason-lspconfig.nvim",
    -- --   "neovim/nvim-lspconfig",
    -- -- },
    --
    -- -- , {
    -- --   "neovim/nvim-lspconfig",
    -- --   opt = true,
    -- --   event = "BufEnter", -- Prefer BufReadPre.. figure out how to debug
    -- --   wants = { "nvim-lsp-installer" },
    -- --   config = function()
    -- --     require("config.lsp.mason").setup()
    -- --   end,
    -- --   dependencies = {
    -- --     "williamboman/mason.nvim",
    -- --     "williamboman/mason-lspconfig.nvim",
    -- --     -- "williamboman/nvim-lsp-installer",
    -- --   },
    -- -- },
    --
    -- -- Harpoon
    -- "nvim-lua/plenary.nvim",
    -- "ThePrimeagen/harpoon",
    --
    -- -- highlight color definitions
    -- {"chrisbra/Colorizer"},
    --
    -- -- ALE (Asynchronous Lint Engine)
    -- {"dense-analysis/ale"},
    --
    -- -- LuaSnip
    -- {
    --   "L3MON4D3/LuaSnip",
    --   config = function()
    --     require("config.luasnip").setup()
    --   end,
    -- },
    --
    -- -- Zen mode
    -- {
    --   "Pocco81/true-zen.nvim",
    --   config = function()
    --     require("true-zen").setup {
    --       -- your config goes here
    --       -- or just leave it empty :)
    --     }
    --   end,
    -- },
    --
    -- -- markdown preview
    -- {"iamcco/markdown-preview.nvim",
    -- build = function() vim.fn["mkdp#util#install"]() end,
    -- },
    --
    -- -- Git intergration
    -- {'kdheepak/lazygit.nvim'},
    --
    -- -- ChatGPT
    -- {
    --   "jackMort/ChatGPT.nvim",
    --   config = function()
    --     require("chatgpt").setup({
    --       -- optional configuration
    --     })
    --   end,
    --   dependencies = {
    --     "MunifTanjim/nui.nvim",
    --     "nvim-lua/plenary.nvim",
    --     "nvim-telescope/telescope.nvim"
    --   }
    -- },
    --
    -- -- Whichkey
    -- {
    --   "folke/which-key.nvim",
    --   event = "BufEnter",
    --   config = function()
    --     require("config.whichkey").setup()
    --   end,
    -- }
   }, opts)
end

return M
