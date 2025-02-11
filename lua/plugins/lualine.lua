return {
	'nvim-lualine/lualine.nvim',
	event = "BufEnter",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		sections = {
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'location' }
		}
	},
}
