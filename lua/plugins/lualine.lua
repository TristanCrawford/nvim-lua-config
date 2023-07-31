local function active_ls()
	local active_clients = vim.lsp.get_active_clients({ bufnr = 0 })
	if #active_clients > 0 then
		return active_clients[1].name
	end
	return "Disconnected"
end

return {
	"https://github.com/nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "onedark",
		},
		sections = {
			lualine_y = {active_ls},
		},
		tabline = {
			lualine_a = {"buffers"},
			lualine_z = {"tabs"},
		},
	}
}
