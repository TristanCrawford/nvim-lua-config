return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/playground",

	-- Languages
	"dag/vim-fish",
	"gabrielelana/vim-markdown",

	-- Language Tooling
	"hrsh7th/vim-vsnip",
	"hrsh7th/vim-vsnip-integ",
	"rafamadriz/friendly-snippets",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-vsnip",

	-- Other
	{ "chrisgrieser/nvim-genghis", dependencies = "stevearc/dressing.nvim" },
	"brenoprata10/nvim-highlight-colors",
	"knsh14/vim-github-link",
	"kyazdani42/nvim-web-devicons",
	{ "lewis6991/gitsigns.nvim", config = true },
	"tpope/vim-abolish",
	"tpope/vim-dispatch",
	"tpope/vim-sleuth",

	-- Color Schemes
	{ "olimorris/onedarkpro.nvim", config = function() vim.cmd[[colorscheme onedark]] end },
}

