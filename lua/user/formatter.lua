local M = {}


function M.setup()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    {
      command = "prettier",
      extra_args = { "--print-with", "100" },
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
        "vue",
        "htmldjango"
      }
    },
  }
end

return M
