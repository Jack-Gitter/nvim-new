return {
	'akinsho/toggleterm.nvim',
	version = "*",
	keys = { "<leader>tt" },
	opts = {
		direction = 'float',
		open_mapping = "<leader>tt",
		float_opts = {
			border = 'curved',
			title_pos = 'center'
		}
	},
	lazy = true
}
