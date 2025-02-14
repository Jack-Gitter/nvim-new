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
		require("fzf-lua").setup(opts)
		vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
		vim.keymap.set("n", "<leader>bu", "<cmd>FzfLua buffers<cr>")
		vim.keymap.set("n", "<leader>gr", "<cmd>FzfLua live_grep<cr>")
		vim.keymap.set("n", "<leader>gd", "<cmd>FzfLua lsp_definitions<cr>")
		vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua lsp_references<cr>")
		vim.keymap.set("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>")
		vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua lsp_document_diagnostics<cr>")
	end,
	keys = { "<leader>ff", "<leader>b", "<leader>gr", "<leader>gd", "<leader>fr" },
}
