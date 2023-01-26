local map = vim.api.nvim_set_keymap
local no_re = { noremap = true }

-- Config
map('n', '<Leader><Leader>', '<Cmd>exe "e "..stdpath("config").."/lua/plugins.lua"<CR>', no_re)

-- Undo Breakpoints
map('i', ',', ',<C-g>u', no_re)
map('i', '.', '.<C-g>u', no_re)

-- Buffer Navigation
map('n', '[b', '<Cmd>bp<CR>', no_re)
map('n', ']b', '<Cmd>bn<CR>', no_re)

-- Tab Management
map('n', '<Leader>tp', '<Cmd>tabprev<CR>', no_re)
map('n', '<Leader>tn', '<Cmd>tabnext<CR>', no_re)
map('n', '<Leader>tc', '<Cmd>tabnew<CR>', no_re)

-- Terminal
map('t', '<C-o>', '<C-\\><C-n>', no_re)
