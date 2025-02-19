return {
	"ray-x/lsp_signature.nvim",
	opts = {
		bind = true,
		hint_enable = false,
		handler_opts = {
			border = "rounded"
		},
	},
	config = function(_, opts)
		local lspsig = require("lsp_signature")
		lspsig.setup(opts)
		vim.keymap.set('n', '<C-k>', lspsig.toggle_float_win)
	end
}
