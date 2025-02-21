return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "ts_ls", "gopls", "pyright", "eslint" } })
        require("mason-nvim-dap").setup({ ensure_installed = { "js" } })
    end
}
