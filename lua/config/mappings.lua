-- Mappings

local utils = require 'config.utils'

vim.cmd('let mapleader = " "')

utils.bind('n', '<Leader><Leader>', '<Cmd>call execute("e "..stdpath("config").."/lua/plugins/packages.lua")<CR>', utils.no_re)
utils.bind('t', '<Esc>', '<C-\\><C-n>', utils.no_re)
