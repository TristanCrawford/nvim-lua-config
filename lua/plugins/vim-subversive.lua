return {
	"svermeulen/vim-subversive",
	config = function()
		vim.keymap.set('o', 'ie', '<Cmd>exec "normal! ggVG"<CR>')
		vim.keymap.set('o', 'iv', '<Cmd>exec "normal! HVL"<CR>')
		vim.keymap.set('s', '<Leader>s', '<Plug>(SubversiveSubvertRange)')
		vim.keymap.set('x', '<Leader>s', '<Plug>(SubversiveSubvertRange)')
		vim.keymap.set('n', '<Leader>ss', '<Plug>(SubversiveSubvertWordRange)')
	end
}
