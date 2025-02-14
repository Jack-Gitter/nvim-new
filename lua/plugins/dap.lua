return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "9999",
			executable = {
				command = "node",
				args = { "/Users/jack.gitter/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "9999" },
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
		vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dg", dap.continue)
	end
}
