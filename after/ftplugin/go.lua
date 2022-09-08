local which_key = require("which-key")

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

lvim.autocommands = {
  "BufWritePre",
  {
    pattern = { "*.go" },
    command = "lua require('go.format').goimport()"
  }
}

lvim.builtin.which_key.mappings["m"] = {
  name = "Mode",
  f = {
    name = "Fill",
    s = { "<cmd>GoFillStruct<cr>", "Fill Struct" },
    w = { "<cmd>GoFillSwitch<cr>", "Fill Switch" },
    e = { "<cmd>GoGoIfErr<cr>", "Fill error" },
    p = { "<cmd>GoFixPlurals<cr>", "Fix Plurals" }
  },
  t = {
    name = "Test",
    t = { "<cmd>GoTestFile -v<cr>", "Test Current file" },
    T = { "<cmd>GoTest -v<cr>", "Test All" },
    f = { "<cmd>GoTestFunc -v<cr>", "Test Current Function" },
    a = { "<cmd>GoAddTest<cr>", "Add Test Current func" }
  },
  x = {
    name = "Add Tag",
    a = { "<cmd>GoAddTag<Cr>", "Add Tags" },
    d = { "<cmd>GoRmTag<Cr>", "Remove Tags" },
    c = { "<cmd>GoClearTag<Cr>", "Clear Tags" }
  }
}

which_key.register(lvim.builtin.which_key.mappings, lvim.builtin.which_key.opts)
