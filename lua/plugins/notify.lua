return {
	"rcarriga/nvim-notify",
	opts = {
		timeout = "2000",
		render = "simple",
		background_colour = "#000000"
	},
	config = function(opts)
		local notify = require("notify")
		notify.setup(opts)
		vim.notify = notify.notify
	end

}
