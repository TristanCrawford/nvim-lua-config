return {
	"akinsho/bufferline.nvim",
	branch = "main",
	config = function()
		require('bufferline').setup {
			options = {
				separator_style = 'slant',
				diagnostics = 'nvim_lsp',
				offsets = {
					{ filetype = 'NvimTree', text = '', text_align = 'left', highlight = 'Directory' }
				}
			}
		}
	end
}
