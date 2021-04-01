-- Settings

vim.g.python3_host_prog = '/usr/bin/python3'

-- local opts = {
-- 	'incsearch',
-- 	'noexpandtab',
-- 	'nohlsearch',
-- 	'number',
-- 	'relativenumber',
-- 	'termguicolors',
-- 	'noswapfile',
-- 	completeopt = 'menuone,noinsert,noselect',
-- 	inccommand = 'nosplit',
-- 	shiftwidth = 2,
-- 	tabstop = 2,
-- 	-- shortmess = '+c'
-- }

-- for k,v in pairs(opts) do
-- 	-- vim.cmd(string.format('echom "%s -> %s"', type(k), v))
-- 	if type(k) == 'string' then
-- 		vim.cmd(string.format('set %s=%s', k, v))
-- 	else
-- 		vim.cmd(string.format('set %s', v))
-- 	end
-- end

vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.swapfile = false
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.inccommand = 'nosplit'
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = false
vim.o.shortmess = vim.o.shortmess..'c'
