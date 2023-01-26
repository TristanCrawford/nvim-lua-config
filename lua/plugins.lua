vim.cmd('packadd packer.nvim')

return require('packer').startup(function()

	use 'wbthomason/packer.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'nvim-treesitter/playground'

	use 'neovim/nvim-lspconfig'
	use 'ray-x/lsp_signature.nvim'

	-- Debugging
	use 'mfussenegger/nvim-dap'

	-- Completion
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq',
		setup = function()
			vim.g.coq_settings = { auto_start = 'shut-up' }
		end
	}
	use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

	-- Other
	use 'kyazdani42/nvim-web-devicons'

	use 'kyazdani42/nvim-tree.lua'

	use { 'akinsho/bufferline.nvim', branch = 'main' }

	use {
		'nvim-telescope/telescope.nvim',
		requires = {{ 'nvim-lua/plenary.nvim' }},
	}

	use {
		'ThePrimeagen/harpoon',
		requires = {{ 'nvim-lua/plenary.nvim' }},
	}

	use 'ThePrimeagen/refactoring.nvim'
	use { 'glepnir/galaxyline.nvim', branch = 'main' }
	use 'tanvirtin/vgit.nvim'
	use 'numToStr/Comment.nvim'
	use 'ggandor/leap.nvim'
	use 'tpope/vim-surround'
	use 'tpope/vim-sleuth'
	use 'tpope/vim-abolish'
	use 'tpope/vim-dadbod'
	use { 'kristijanhusak/vim-dadbod-ui', requires = { 'tpope/vim-dadbod' } }
	use 'junegunn/vim-easy-align'
	use 'svermeulen/vim-subversive'
	use 'vim-test/vim-test'
	use 'brenoprata10/nvim-highlight-colors'
	use 'knsh14/vim-github-link'

	-- Color Schemes
	use { 'olimorris/onedarkpro.nvim', config = 'vim.cmd[[colorscheme onedark]]' }

	-- Language Specific
	use 'dag/vim-fish'
	use 'gabrielelana/vim-markdown'
	use 'vim-crystal/vim-crystal'
end)
