local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"
local which_key = require("which-key")

vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.ts = 4
vim.opt_local.expandtab = true
vim.opt_local.autoindent = true

formatters.setup {
  { command = "gdformat", filetypes = { "gd", "gdscript" } }
}

linters.setup { { command = "gdlint", filetypes = { "gd", "gdscript" } } }


local godot_run = function(opts)
  opts = opts or {}
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)
  local picker = pickers.new(opts, {
    prompt_title = "Select Scence",
    finder = finders.new_oneshot_job({ "find", ".", "-name", "*.tscn", "-type", "f" }, opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
        vim.cmd("! godot" .. " " .. selection[1])
        vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      return true
    end,
  })
  picker:find()
end

vim.api.nvim_create_user_command("GodotRun", function()
  godot_run()
end, {})

lvim.builtin.which_key.mappings["m"] = {
  name = "Mode",
  r = { "<cmd>GodotRun<cr>", "GodotRun" }
}

which_key.register(lvim.builtin.which_key.mappings, lvim.builtin.which_key.opts)
