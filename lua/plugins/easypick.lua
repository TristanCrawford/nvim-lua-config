return {
	"axkirillov/easypick.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local easypick = require("easypick")
		easypick.setup {
			pickers = {
				{
					name = "last_commit",
					command = "git diff-tree --no-commit-id --name-only HEAD -r",
					previewer = easypick.previewers.branch_diff({ base_branch = "master" })
				},
			}
		}

		vim.keymap.set("n", "<Leader>tl", "<Cmd>Easypick last_commit<CR>", {desc = "Last Commit"})
	end,
}
