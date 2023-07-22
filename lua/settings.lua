local o = vim.o
local g = vim.g

g.mapleader = ' '
g.do_filetype_lua = 1

o.tgc   = true
o.hid   = true
o.nu    = true
o.rnu    = true
o.ts    = 2
o.sw    = 2
o.et    = false
o.ut    = 300
o.shm   = o.shm .. 'c'
o.bk    = false
o.wb    = false
o.list  = true
o.wrap  = false
o.lbr   = true
o.sbr   = '↪ '
o.lcs   = 'tab:→ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨'
o.so    = 8
o.mouse = 'a'
o.cb    = 'unnamedplus'
o.smd   = false
o.scl   = 'yes'
o.ea    = false

-- Split Direction
o.spr = true
o.sb  = true

o.cot = 'menu,menuone,noselect'

-- Grep
o.grepprg = 'rg --vimgrep'
o.grepformat = '%f:%l:%c:%m'
