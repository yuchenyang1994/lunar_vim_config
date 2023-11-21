local M = {}

local function tabnine_build_path()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    return "pwsh.exe -file .\\dl_binaries.ps1"
  else
    return "./dl_binaries.sh"
  end
end

M.plugins = {
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    lazy = true,
    config = function()
      require('neogit').setup {
        integrations = {
          diffview = true
        },

      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup {}
    end
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup({})
    end
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    config = function()
      require 'telescope'.load_extension('project')
    end
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" },
    config = function()
      require('glow').setup({})
    end
  },
  {
    "EdenEast/nightfox.nvim"
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup {
        tools = {
          executor = require("rust-tools/executors").quickfix,
          reload_workspace_from_cargo_toml = true,
          autoSetHints = true,
          inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
          },
        },
        server = {
          on_init = require("lvim.lsp").common_on_init,
          on_attach = require("lvim.lsp").common_on_attach,
        },
      }
    end,
    ft = { "rust", "rs" },
  },
  {
    "NTBBloodbath/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup {}
    end
  },
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require("diffview").setup {}
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".setup() end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "ray-x/go.nvim",
    config = function()
      require('go').setup()
    end,
    ft = { "go" }
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
    ft = "qf"
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end
  },
  {
    'pianocomposer321/yabs.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('yabs'):setup {}
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "tpope/vim-surround",
  },
  {
    "lommix/godot.nvim"
  },
  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    config = function()
      require("surround-ui").setup({
        root_key = "S"
      })
    end,
  },
}

return M
