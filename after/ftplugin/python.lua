local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black", filetypes = { "python" } },
  { name = "isort", filetypes = { "Python" } }
}
