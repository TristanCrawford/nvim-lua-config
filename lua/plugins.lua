local plugins = {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Languages
  "dag/vim-fish",
  "gabrielelana/vim-markdown",

  -- Language Tooling
  "neovim/nvim-lspconfig",
  "mfussenegger/nvim-dap",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/nvim-cmp",

  -- Other
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "akinsho/bufferline.nvim", branch = "main" },
  { "glepnir/galaxyline.nvim", branch = "main" },
  { "chrisgrieser/nvim-genghis", dependencies = "stevearc/dressing.nvim" },

  "ThePrimeagen/refactoring.nvim",
  "brenoprata10/nvim-highlight-colors",
  "ggandor/leap.nvim",
  "junegunn/vim-easy-align",
  "knsh14/vim-github-link",
  "kyazdani42/nvim-tree.lua",
  "kyazdani42/nvim-web-devicons",
  "kylechui/nvim-surround",
  "numToStr/Comment.nvim",
  "svermeulen/vim-subversive",
  "tanvirtin/vgit.nvim",
  "tpope/vim-abolish",
  "tpope/vim-dispatch",
  "tpope/vim-sleuth",
  "vim-test/vim-test",

  -- Color Schemes
  "olimorris/onedarkpro.nvim",
  { "JoosepAlviste/palenightfall.nvim", config = function() vim.cmd[[colorscheme palenightfall]] end, },
}

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

require("lazy").setup(plugins)
