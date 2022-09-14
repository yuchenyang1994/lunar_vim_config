local which_key = require("which-key")

lvim.builtin.which_key.mappings["m"] = {
  name = "Mode",
  r = { "<cmd>RustRunnables<CR>", "Runnables" },
  d = { "<cmd>RustDebuggables<CR>", "Debug Runnables" }
}


which_key.register(lvim.builtin.which_key.mappings, lvim.builtin.which_key.opts)
