local dap = require('dap')

dap.adapters.c = {
	type = 'executable',
	attach = {
		pidProperty = 'pid',
		pidSelect = 'ask'
	},
	command = 'lldb-vscode',
	env = {
		LLDB_LAUNCH_FLAG_IN_TTY = 'yes'
	},
	name = 'lldb'
}
