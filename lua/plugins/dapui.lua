return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		{
			"nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},
	opts = {},
	config = function(opts)
		require("dapui").setup(opts)
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.fn.sign_define('DapStopped', { text = '➜', texthl = '', linehl = '', numhl = '' })
		vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'MiniIconsRed', linehl = '', numhl = '' })
		vim.fn.sign_define('DapBreakpointCondition', { text = '●', texthl = 'MiniIconsBlue', linehl = '', numhl = '' })
		vim.fn.sign_define('DapBreakpointRejected', { text = '✖', texthl = 'MiniIconsRed', linehl = '', numhl = '' })
	end
}
