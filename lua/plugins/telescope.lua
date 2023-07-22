return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')
		local previewers = require('telescope.previewers')

		vim.keymap.set('n', '<C-p>', builtin.find_files)
		vim.keymap.set('n', '<Leader>tf', builtin.live_grep)
		vim.keymap.set('n', '<Leader>th', builtin.help_tags)
		vim.keymap.set('n', '<Leader>tb', builtin.buffers)
		vim.keymap.set('n', '<Leader>tg', builtin.git_status)
		vim.keymap.set('n', '<M-c>', function()
			builtin.find_files({search_dirs = {vim.fn.stdpath('config')}})
		end)

		-- LSP
		vim.keymap.set('n', '<Leader>td', builtin.lsp_definitions)
		vim.keymap.set('n', '<Leader>tr', builtin.lsp_references)
		vim.keymap.set('n', '<Leader>ti', builtin.lsp_implementations)
		vim.keymap.set('n', '<Leader>ts', builtin.lsp_document_symbols)
		vim.keymap.set('n', '<Leader>te', function()
			builtin.diagnostics({ bufnr = 0 })
		end)
		vim.keymap.set('n', '<Leader>tt', builtin.treesitter)
		vim.keymap.set('n', '<Leader>tk', builtin.keymaps)

		-- Don't preview files > 100000 bytes

		require('telescope').setup {
			defaults = {
				file_ignore_patterns = {
					'^(node_modules|_build|deps|target|zig-out|zig-cache)/',
				},
				buffer_previewer_maker = function(filepath, bufnr, opts)
					opts = opts or {}
					filepath = vim.fn.expand(filepath)
					vim.loop.fs_stat(filepath, function(_, stat)
						if not stat then return end
						if stat.size > 100000 then
							return
						else
							previewers.buffer_previewer_maker(filepath, bufnr, opts)
						end
					end)
				end,
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							['<C-r>'] = actions.delete_buffer
						}
					}
				}
			}
		}
	end
}
