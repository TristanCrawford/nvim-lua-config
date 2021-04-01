local utils = require 'config.utils'

utils.nvim_create_augroups({
		MyShit = {
			-- {'BufEnter', '*', "lua require'completion'.on_attach()"};
			{'BufWritePost', 'packages.lua', 'PackerCompile'};
		};
})
