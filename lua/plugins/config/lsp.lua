local nvim_lsp = require 'lspconfig'
local configs = require 'lspconfig/configs'
local utils = require 'config.utils'

-- local function preview_location_callback(_, method, result)
--   if result == nil or vim.tbl_isempty(result) then
--     vim.lsp.log.info(method, 'No location found')
--     return nil
--   end
--   if vim.tbl_islist(result) then
--     vim.lsp.util.preview_location(result[1])
--   else
--     vim.lsp.util.preview_location(result)
--   end
-- end

-- function peek_definition()
--   local params = vim.lsp.util.make_position_params()
--   return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
-- end

local on_attach = function(client, bufnr)

  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	require'completion'.on_attach(client)

  -- Mappings
  utils.bind('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', utils.no_re)
  utils.bind('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', utils.no_re)
  utils.bind('n', '<Leader>qd', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', utils.no_re)
  utils.bind('n', '<Leader>qs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', utils.no_re)
  utils.bind('n', '<Leader>qr', '<cmd>lua vim.lsp.buf.references()<CR>', utils.no_re)
  utils.bind('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', utils.no_re)
  utils.bind('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', utils.no_re)
  utils.bind('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', utils.no_re)
  utils.bind('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', utils.no_re)
  utils.bind('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', utils.no_re)
  utils.bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', utils.no_re)
  utils.bind('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', utils.no_re)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    utils.bind("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", utils.no_re)
  elseif client.resolved_capabilities.document_range_formatting then
    utils.bind("n", "<Leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", utils.no_re)
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = true,
	}
)

require'config.utils'.nvim_create_augroups({
	LspAU = {
		{ 
			'CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost',
			'*',
			"lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = 'Comment', enabled = {'TypeHint', 'ChainingHint', 'ParameterHint'} }"
		};
	}
})

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "dartls", "tsserver", "pyls", "elixirls", "clangd" } -- denols, rust_analyzer

for _, lsp in ipairs(servers) do

  local opts = { on_attach = on_attach }

  if lsp == 'vls' then opts.cmd = {'vls'} end
  if lsp == 'elixirls' then opts.cmd = {'/home/tristan/.elixirls/language_server.sh'} end

  nvim_lsp[lsp].setup(opts)
end
