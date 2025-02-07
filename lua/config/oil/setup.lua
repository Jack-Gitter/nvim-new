require("oil").setup({
  keymaps = {
    ["b"] = { "actions.parent", mode = "n" },
    ["o"] = { "actions.open_cwd", mode = "n" },
  },
})
