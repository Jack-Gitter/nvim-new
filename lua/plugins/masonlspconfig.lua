return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls",
            "ts_ls",
            "gopls",
            "pyright",
            "eslint"
        }
    }
}
