-- Undo Breakpoints
vim.keymap.set('i', ',', ',<C-g>u')
vim.keymap.set('i', '.', '.<C-g>u')

-- Buffer Navigation
vim.keymap.set('n', '[b', '<Cmd>bp<CR>')
vim.keymap.set('n', ']b', '<Cmd>bn<CR>')

-- Tab Management
vim.keymap.set('n', '[t', '<Cmd>tabprev<CR>')
vim.keymap.set('n', ']t', '<Cmd>tabnext<CR>')
vim.keymap.set('n', '<Leader>tn', '<Cmd>tabnew<CR>')

-- Terminal
vim.keymap.set('t', '<C-o>', '<C-\\><C-n>')
