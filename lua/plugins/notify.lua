return {
	"rcarriga/nvim-notify",
	opts = {
		timeout = "3000",
		render = "simple"
	},
	config = function()
		vim.notify = require("notify").notify
	end

}
