return {
	"glepnir/galaxyline.nvim",
	branch = "main",
	config = function()
		local gl = require('galaxyline')
		local condition = require('galaxyline.condition')

		local colors = {
			bg         = '#282C34',
			fg         = '#ABB2BF',
			gutter     = '#4B5263',
			yellow     = '#E5C07B',
			cyan       = '#56B6C2',
			green      = '#98C379',
			orange     = '#D19A66',
			magenta    = '#C678DD',
			blue       = '#61AFEF',
			red        = '#E06C75'
		}

		local mode_colors = {
			i = colors.green,
			n = colors.blue
		}

		-- gl.short_line_list = { 'NvimTree', 'packer' }

		gl.section = {
			left = {
				{
					ViMode = {
						provider = function()
							local mode = vim.fn.mode()
							vim.cmd('hi GalaxyViMode guifg='..(mode_colors[mode] or colors.magenta))
							return '   '
						end,
						highlight = { colors.fg, colors.gutter, 'bold' },
						separator = '',
						separator_highlight = { colors.gutter, 'none' }
					}
				},
				{
					FileSize = {
						provider = 'FileSize',
						condition = condition.buffer_not_empty,
						highlight = {colors.fg, colors.bg}
					}
				},
				{
					FileIcon = {
						provider = 'FileIcon',
						condition = condition.buffer_not_empty,
						highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
					}
				},
				{
					FileName = {
						provider = 'FileName',
						condition = condition.buffer_not_empty,
						highlight = {colors.magenta, colors.bg, 'bold'}
					}
				},
				{
					LineInfo = {
						provider = 'LineColumn',
						separator = ' ',
						separator_highlight = { 'NONE', colors.bg },
						highlight = { colors.fg, colors.bg },
					}
				},
			},
			mid = {},
			right = {
				{
					ShowLspClient = {
						provider = 'GetLspClient',
						condition = function ()
							local ignore = {['dashboard'] = true,['']=true}
							if ignore[vim.bo.ft] then
								return false
							end
							return true
						end,
						icon = '  ',
						separator = ' ',
						highlight = { colors.blue, 'NONE', 'bold'}
					}
				},
				{
					DiagnosticError = {
						provider = 'DiagnosticError',
						icon = '  ',
						highlight = {colors.red, colors.bg}
					}
				},
				{
					DiagnosticWarn = {
						provider = 'DiagnosticWarn',
						icon = '  ',
						highlight = {colors.yellow, colors.bg},
					}
				},
				{
					DiagnosticHint = {
						provider = 'DiagnosticHint',
						icon = '  ',
						highlight = {colors.cyan, colors.bg},
					}
				},
				{
					DiagnosticInfo = {
						provider = 'DiagnosticInfo',
						icon = '  ',
						highlight = {colors.blue, colors.bg},
					}
				},
				{
					FileEncode = {
						provider = 'FileEncode',
						condition = condition.hide_in_width,
						separator = ' ',
						separator_highlight = {'NONE', colors.bg},
						highlight = {colors.green, colors.bg, 'bold'}
					}
				},
				{
					FileFormat = {
						provider = function()
							local os = {
								['unix'] = '  ',
								['dos'] = '  ',
								['mac'] = '  '
							}
							return os[vim.bo.ff]
						end,
						condition = condition.hide_in_width,
						separator = ' ',
						separator_highlight = {'NONE', colors.bg},
						highlight = {colors.green, colors.bg, 'bold'}
					}
				},
				{
					GitBranch = {
						provider = 'GitBranch',
						condition = condition.check_git_workspace,
						highlight = {colors.magenta, colors.bg, 'bold'},
					}
				},
				{
					DiffAdd = {
						provider = 'DiffAdd',
						condition = condition.hide_in_width,
						icon = '   ',
						highlight = {colors.green, colors.bg},
					}
				},
				{
					DiffModified = {
						provider = 'DiffModified',
						condition = condition.hide_in_width,
						icon = '  柳',
						highlight = {colors.orange, colors.bg},
					}
				},
				{
					DiffRemove = {
						provider = 'DiffRemove',
						condition = condition.hide_in_width,
						icon = '   ',
						highlight = {colors.red, colors.bg},
					}
				},
			},
			short_line_left = {
				{
					BufferType = {
						provider = 'FileTypeName',
						separator = ' ',
						separator_highlight = {'NONE', colors.bg},
						highlight = {colors.blue, colors.bg, 'bold'}
					}
				},
				{
					SFileName = {
						provider = 'SFileName',
						condition = condition.buffer_not_empty,
						highlight = {colors.fg, colors.bg, 'bold'}
					}
				},
			},
			short_line_right = {
				{
					BufferIcon = {
						provider= 'BufferIcon',
						highlight = {colors.fg, colors.bg}
					}
				},
			}
		}
	end
}
