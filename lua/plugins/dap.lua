return {
    "mfussenegger/nvim-dap",
    config = function()
        vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '❓', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '🛑', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointRejected', { text = '❌', texthl = '', linehl = '', numhl = '' })
        vim.keymap.set('n', '<leader>dg', function() require('dap').continue() end)
        vim.keymap.set('n', '<leader>dso', function() require('dap').step_over() end)
        vim.keymap.set('n', '<leader>dsi', function() require('dap').step_into() end)
        vim.keymap.set('n', '<leader>dst', function() require('dap').step_out() end)
        vim.keymap.set('n', '<Leader>tb', function() require('dap').toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
        local dap = require("dap")
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
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
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require('dap.utils').pick_process,
                cwd = "${workspaceFolder}",
            }
        }
    end
}
