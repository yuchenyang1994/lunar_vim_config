local formatters = require "lvim.lsp.null-ls.formatters"
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true

formatters.setup {
  { command = "gdformat" }
}
