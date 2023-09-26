local M = {}


function M.setup()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    {
      command = "prettier",
      extra_args = { "--print-with", "100" },
      filetypes = { "typescript", "markdown", "javascript", "typescriptreact", "javascriptreact", "json", "yaml", "http",
        "vue" }
    },
  }
end

return M
