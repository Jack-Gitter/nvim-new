return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		files = {
			previewer = false
		}
	},
	config = function(_, opts)
		local fzf = require("fzf-lua")

		fzf.setup(opts)
		fzf.register_ui_select()

		local ff = function()
			local folders = vim.lsp.buf.list_workspace_folders()
			if next(folders) ~= nil then
				fzf.files({ cwd = folders[1] })
			else
				fzf.files()
			end
		end

		vim.keymap.set("n", "<leader>ff", ff)
		vim.keymap.set("n", "<leader>bu", fzf.buffers)
		vim.keymap.set("n", "<leader>gr", fzf.live_grep)
		vim.keymap.set("n", "<leader>gb", fzf.git_branches)
		vim.keymap.set("n", "<leader>ws", fzf.lsp_live_workspace_symbols)
		vim.keymap.set("n", "<leader>fd", fzf.lsp_document_diagnostics)
		vim.keymap.set("n", "<leader>gd", fzf.lsp_definitions)
		vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions)
		vim.keymap.set("n", "<leader>fr", fzf.lsp_references)
	end,
	keys = { "<leader>ff", "<leader>b", "<leader>gr", "<leader>gd", "<leader>fr" },
}
