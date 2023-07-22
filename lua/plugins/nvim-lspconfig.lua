return {
	"neovim/nvim-lspconfig",
	config = function()
		local lsp = require('lspconfig')
		local configs = require('lspconfig.configs')
		local util = require('lspconfig.util')

		local on_attach = function(client, bufnr)
			local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
			local function opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end

			opt('formatexpr', 'v:lua.vim.lsp.formatexpr()')
			opt('omnifunc', 'v:lua.vim.lsp.omnifunc')
			opt('tagfunc', 'v:lua.vim.lsp.tagfunc')

			local opts = { noremap = true, silent = true }

			map('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
			map('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
			map('n', '<S-h>', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
			map('n', '<Leader>gq', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)
			map('n', '<Leader>ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
			map('n', '<Leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
			map('n', '<Leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
			map('n', '<Leader>gf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
			map('n', '<Leader>gn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
		end

		local servers = { 'tsserver', 'vuels', 'svelte', 'solargraph', 'syntax_tree', 'zls', 'rust_analyzer', 'ols' }

		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		local default_cfg = {
			on_attach = on_attach,
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			}
		}

		local extra_cfg = {
			solargraph = {
				init_options = { formatting = false },
			},
			svelte = {
				init_options = {
					configuration = {
						svelte = {
							plugin = {
								typescript = {
									diagnostics = { enable = false },
								},
							},
						},
					},
				},
			},
		}

		for _, s in ipairs(servers) do
			local final_cfg = vim.tbl_deep_extend('force', default_cfg, extra_cfg[s] or {})
			lsp[s].setup(final_cfg)
		end
	end
}
