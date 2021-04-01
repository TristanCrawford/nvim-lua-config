require 'telescope'.setup({ defaults = { prompt_prefix = '  ' } })

local utils = require 'config.utils'
utils.bind('n', '<C-p>', '<Cmd>Telescope find_files theme=get_dropdown<CR>', utils.no_re)
utils.bind('n', '<C-h>', '<Cmd>Telescope help_tags theme=get_dropdown<CR>', utils.no_re)
utils.bind('n', '<C-f>', '<Cmd>Telescope live_grep theme=get_dropdown<CR>', utils.no_re)
utils.bind('n', '<M-c>', "<Cmd>lua require'telescope.builtin'.find_files{search_dirs={'~/.config/nvim'}}<CR>", utils.no_re)
