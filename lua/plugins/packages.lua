vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use { 'wbthomason/packer.nvim', opt = true }

	use { 'alaviss/nim.nvim' }
	use { 'chriskempson/base16-vim',
		config = function()
			if vim.fn.filereadable('~/.vimrc_background') then
				vim.cmd('let base16colorspace=256')
				vim.cmd('source ~/.vimrc_background')
				vim.cmd('hi LineNr guibg=none')
				vim.cmd('hi CursorLineNr guibg=none guifg=#98c379 gui=bold')
			end
		end
	}
	use { 'elixir-editors/vim-elixir'}
	use { 'glepnir/galaxyline.nvim',
		opt = true,
		branch = 'main',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function() require 'plugins.config.statusline' end
	}
	use { 'junegunn/vim-easy-align',
		config = function()
			local utils = require 'config.utils'
			utils.bind('n', 'ga', '<Plug>(LiveEasyAlign)', utils.re)
			utils.bind('x', 'ga', '<Plug>(LiveEasyAlign)', utils.re)
		end
	}
	use { 'mfussenegger/nvim-dap' }
	use { 'neovim/nvim-lspconfig',
		config = function() require 'plugins.config.lsp' end
	}
	use { 'norcalli/nvim-colorizer.lua' }
	use { 'norcalli/snippets.nvim' }
	use { 'nvim-lua/completion-nvim',
		config = function()
			vim.g.completion_matching_smart_case = 1
			vim.g.completion_chain_complete_list = {
				default = {
					{ complete_items = { 'lsp', 'snippet', 'path' } },
					{ mode = '<C-p>' },
					{ mode = '<C-n>' },
				}
			}
		end
	}
	use { 'nvim-lua/lsp_extensions.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'nvim-lua/popup.nvim' }
	use { 'nvim-telescope/telescope.nvim',
		config = function() require 'plugins.config.telescope' end
	}
	use { 'nvim-treesitter/nvim-treesitter',
		run = function() vim.cmd('TSUpdate') end,
		config = function()
			require 'nvim-treesitter.configs'.setup {
				highlight = { enable = true },
			}
		end
	}
	use { 'nvim-treesitter/playground' }
	use { 'ollykel/v-vim' }
	use { 'svermeulen/vim-subversive',
		config = function() require 'plugins.config.subversive' end
	}
	use { 'tpope/vim-abolish' }
	use { 'tpope/vim-commentary' }
	use { 'tpope/vim-sleuth' }
	use { 'tpope/vim-surround' }
end)
