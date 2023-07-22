return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require('cmp')

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local feedkey = function(key, mode)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn['vsnip#anonymous'](args.body)
				end
			},
			mapping = cmp.mapping.preset.insert({
				['<C-Space>'] = cmp.mapping.complete(),
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						feedkey("<Plug>(vsnip-expand-or-jump)", "")
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, {'i', 's'}),
				["<S-Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#jumpable"](-1) == 1 then
						feedkey("<Plug>(vsnip-jump-prev)", "")
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'vsnip' },
				{ name = 'path' },
				{
					name = 'buffer',
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end
					}
				},
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = ({
						buffer = "[Buf]",
						nvim_lsp = "[LS]",
						nvim_lsp_signature_help = "[Sig]",
						path = "[FS]",
						vsnip = "[Snip]",
					})[entry.source.name]

					return vim_item
				end
			},
		})
	end
}
