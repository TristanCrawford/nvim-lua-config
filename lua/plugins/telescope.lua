return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')
		local previewers = require('telescope.previewers')

		vim.keymap.set('n', '<C-p>', builtin.find_files, {desc = "Find Files"})
		vim.keymap.set('n', '<Leader>tf', builtin.live_grep, {desc="Workspace Grep"})
		vim.keymap.set('n', '<Leader>th', builtin.help_tags, {desc = "Helptags"})
		vim.keymap.set('n', '<Leader>tb', builtin.buffers, {desc = "Buffers"})
		vim.keymap.set('n', '<Leader>tg', builtin.git_status, {desc = "Git Status"})
		vim.keymap.set('n', '<M-c>', function()
			builtin.find_files({search_dirs = {vim.fn.stdpath('config')}})
		end)

		-- LSP
		vim.keymap.set('n', '<Leader>td', builtin.lsp_definitions, {desc = "LSP Definitions"})
		vim.keymap.set('n', '<Leader>tr', builtin.lsp_references, {desc = "LSP References"})
		vim.keymap.set('n', '<Leader>ti', builtin.lsp_implementations, {desc = "LSP Implementations"})
		vim.keymap.set('n', '<Leader>ts', builtin.lsp_document_symbols, {desc = "LSP Document Symbols"})
		vim.keymap.set('n', '<Leader>te', function()
			builtin.diagnostics({ bufnr = 0 })
		end, {desc = "Diagnostics"})
		vim.keymap.set('n', '<Leader>tt', builtin.treesitter, {desc = "Treesitter"})
		vim.keymap.set('n', '<Leader>tk', builtin.keymaps, {desc = "Keymaps"})

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
