local condition = require 'galaxyline.condition'
local fileinfo  = require 'galaxyline.provider_fileinfo'
local lspclient = require 'galaxyline.provider_lsp'
local vcs       = require 'galaxyline.provider_vcs'
local section   = require 'galaxyline'.section

local colors = {
  black = '#282c34',
  red = '#e06c75',
  green = '#98c379',
  yellow = '#e5c07b',
  blue = '#61afef',
  magenta = '#c678dd',
  cyan = '#56b6c2',
  white = '#abb2bf',
  alt_yellow = '#d19a66',
  alt_red = '#be5046',
  dark_grey = '#353b45',
  light_grey = '#3e4451',
}

local modes = {
  ['n']  = { colors.magenta, '' },
  ['i']  = { colors.green,   '' },
  ['v']  = { colors.blue,    '' },
  [''] = { colors.blue,    '' },
  ['V']  = { colors.blue,    '' },
  ['c']  = { colors.yellow,  '' },
  ['no'] = { colors.magenta, '' },
  ['s']  = { colors.yellow,  '' },
  ['S']  = { colors.yellow,  '' },
  [''] = { colors.yellow,  '' },
  ['ic'] = { colors.yellow,  '' },
  ['R']  = { colors.magenta, '' },
  ['Rv'] = { colors.magenta, '' },
  ['cv'] = { colors.red,     '' },
  ['ce'] = { colors.red,     '' },
  ['r']  = { colors.cyan,    '' },
  ['rm'] = { colors.cyan,    '' },
  ['r?'] = { colors.cyan,    '' },
  ['!']  = { colors.red,     '' },
  ['t']  = { colors.blue,    '' }
}

section.left = {
  {
    ViMode = {
      provider = function()
        local mode = modes[vim.fn.mode()]
        local color = mode[1]
        local icon = mode[2]

        vim.cmd('hi GalaxyViMode guibg='..color)

        return string.format('  %s ', icon)
      end,
      highlight = { colors.black, 'none' }
    }
  },
  {
    FileIcon = {
      provider = function() return string.format('  %s', fileinfo.get_file_icon()) end,
      condition = condition.buffer_not_empty,
      highlight = { fileinfo.get_file_icon_color, colors.dark_grey },
    }
  },
  {
    FileName = {
      provider = function() return string.format(' %s', fileinfo.get_current_file_name()) end,
      condition = condition.buffer_not_empty,
      highlight = { colors.white, colors.dark_grey }
    }
  },
  {
    FileSize = {
      provider = function() return string.format('  %s', fileinfo.get_file_size()) end,
      condition = condition.buffer_not_empty,
      highlight = { colors.white, colors.light_grey }
    }
  },
  -- {
  --   TreeSitter = {
  --     provider = function() return vim.fn.execute('call nvim_treesitter#statusline(90)') end,
  --     highlight = { colors.white, colors.dark_grey }
  --   }
  -- },
  {
    Space = {
      provider = function() return ' ' end,
      highlight = { 'none', 'none' }
    }
  },
}

-- section.mid = {
-- }

section.right = {
  {
    LspStatus = {
      provider = function() return string.format('  %s ', lspclient.get_lsp_client()) end,
      condition = condition.check_active_lsp,
      highlight = { colors.blue, colors.light_grey, 'bold' },
    }
  },
  {
    GitBranch = {
      provider = function()
        local val = vcs.get_git_branch()
        return string.format('  %s ', val)
      end,
      condition = condition.check_git_workspace,
      highlight = { colors.green, colors.dark_grey, 'bold' },
    }
  },
  {
    LineColumn = {
      provider = function() return string.format('  %s ', fileinfo.line_column()) end,
      highlight = { colors.black, colors.magenta, 'bold' },
    }
  },
}
