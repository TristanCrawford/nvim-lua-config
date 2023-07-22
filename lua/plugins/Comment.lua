return {
	"numToStr/Comment.nvim",
	config = function()
		require('Comment').setup {}
		vim.keymap.set('v', 'gC', ':norm gcc<CR>') -- Can't use <Cmd> here for whatever reason...
	end
}
