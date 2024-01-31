return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require('nvim-tree').setup {}
		vim.keymap.set('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>')
	end
}
