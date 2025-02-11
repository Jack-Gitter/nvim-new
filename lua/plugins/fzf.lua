return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = { "<leader>ff", "<leader>b", "<leader>gr", "<leader>gd", "<leader>fr" },
	config = function(plugin, opts)
		require("fzf-lua").setup(opts)
		vim.keymap.set("n", "<leader>ff", "<Cmd>FzfLua files<CR>")
		vim.keymap.set("n", "<leader>b", "<Cmd>FzfLua buffers<CR>")
		vim.keymap.set("n", "<leader>gr", "<Cmd>FzfLua live_grep<CR>")
		vim.keymap.set("n", "<leader>gd", "<Cmd>FzfLua lsp_definitions<CR>")
		vim.keymap.set("n", "<leader>fr", "<Cmd>FzfLua lsp_references<CR>")
	end,
}
