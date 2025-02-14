return {
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {}
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = {
				ensure_installed = { 'js' },
			}
		}
	},
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "9999",
			executable = {
				command = "node",
				args = { string.format('%s/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', vim.fn.stdpath('data')), "9999" }
			}
		}
		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}
		dap.configurations.typescript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}
		vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dg", dap.continue)
		vim.keymap.set("n", "<leader>ds", function() dap.disconnect({ terminateDebuggee = true }) end)
	end
}
