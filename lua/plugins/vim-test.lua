return {
	"vim-test/vim-test",
	config = function()
		vim.keymap.set('n', '<Leader>rnt', '<Cmd>TestNearest<CR>')
		vim.keymap.set('n', '<Leader>rt', '<Cmd>TestFile<CR>')
	end
}
