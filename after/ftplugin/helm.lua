vim.treesitter.language.register("gotmpl", "helm")

vim.treesitter.query.set("gotmpl", "injections", "(text) @yaml")

vim.treesitter.highlighter.get_query("yaml", "helm")


require("lvim.lsp.manager").setup("helm_ls", {
  filetypes = { "helm" },
  cmd = { "helm_ls", "serve" },
})
