local which_key = require("which-key")

lvim.builtin.which_key.mappings["m"] = {
  name = "Mode",
  r = { "<cmd>lua require('rest-nvim').run()<cr>", "Run" }
}

which_key.register(lvim.builtin.which_key.mappings, lvim.builtin.which_key.opts)
