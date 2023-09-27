lvim.builtin.which_key.mappings["m"] = {
  name = "Mode",
  r = { "<cmd>Telescope yaml_schema<cr>", "Schema Store" }
}

which_key.register(lvim.builtin.which_key.mappings, lvim.builtin.which_key.opts)
