local utils = require 'config.utils'

utils.bind('n', '<Leader>s', '<plug>(SubversiveSubvertRange)', utils.re)
utils.bind('n', '<Leader>ss', '<plug>(SubversiveSubvertWordRange)', utils.re)
utils.bind('x', '<Leader>s', '<plug>(SubversiveSubvertRange)', utils.re)

utils.bind('o', 'ie', '<Cmd>exec "normal! ggVG"<CR>', utils.re)
utils.bind('o', 'iv', '<Cmd>exec "normal! HVL"<CR>', utils.re)
