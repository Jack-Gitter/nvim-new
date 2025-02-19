return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        direction = 'float',
        float_opts = {
            border = 'curved',
            title_pos = 'center'
        }
    },
    config = function(_, opts)
        local tt = require("toggleterm")
        tt.setup(opts)
        vim.keymap.set("n", "<leader>tt", function() vim.cmd("ToggleTerm") end)
        vim.keymap.set("t", "<esc>", function() vim.cmd("ToggleTerm") end)
    end
}
