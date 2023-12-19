local opts = {
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}


require("lvim.lsp.manager").setup("yaml", opts)
require("lvim.lsp.manager").setup("helm_ls", {
  filetypes = { "yaml" },
  cmd = { "helm_ls", "serve" },
})
