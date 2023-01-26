local mkGroup = vim.api.nvim_create_augroup
local mkCmd = vim.api.nvim_create_autocmd

local packerGroup = mkGroup('PackerUpdate', { clear = true })
mkCmd('BufWritePost', {
	group = packerGroup,
	pattern = 'plugins.lua',
	callback = function()
		vim.cmd [[luafile %]]
		vim.cmd [[PackerCompile]]
	end
})

local hlGroup = mkGroup('YankHighlight', { clear = true })
mkCmd('TextYankPost', {
	group = hlGroup,
	callback = function()
		vim.highlight.on_yank()
	end
})

local termGroup = mkGroup('TermNice', { clear = true })
mkCmd('TermOpen', {
	group = termGroup,
	callback = function()
		vim.cmd [[startinsert | setlocal nonu nornu]]
		vim.keymap.set('n', '<Esc>', '<C-\\><C-n>', { buffer = true })
	end
})

local ftGroup = mkGroup('ExtraFiletypes', { clear = true })
mkCmd({ 'BufRead', 'BufNew' }, {
	group = ftGroup,
	pattern = '*.gd',
	command = 'set ft=gdscript'
})
