return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = {
      ["b"] = { "actions.parent", mode = "n" },
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
