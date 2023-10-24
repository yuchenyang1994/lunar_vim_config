local M = {}

M.vmappings = {
  [";"] = {
    name = "Comment",
    [";"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" }
  }
}

M.nmappings = {
  f = {
    name = "File",
    s = { "<cmd>w!<CR>", "Save" },
    f = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" },
  },
  h = {
    name = "Highlights",
    s = { "<cmd>setlocal spell spelllang=en_us,cjk<cr>", "Spell" },
    S = { "<cmd>setlocal nospell<cr>", "No Spell" }
  },

  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    b = { "<cmd>Telescope buffers<cr>", "Find" },
    p = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    d = { "<cmd>BufferKill<cr>", "Kill" },
    -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },

  ["<tab>"] = {
    name = "Workspace",
    ["<tab>"] = { "<cmd>$tabnew<CR>", "New tabs" },
    n = { "<cmd>tabn<CR>", "New Tab" },
    d = { "<cmd>tabclose<CR>", "Close" },
    p = { "<cmd>tabp<CR>", "Previous" },

  },

  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    B = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    s = { "<cmd>Neogit kind=split<CR>", "Git Status" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>DiffviewOpen<cr>",
      "Git Diff",
    },
    h = {
      name = "History",
      b = { "<cmd>DiffviewFileHistory<cr>", "Current Branch" },
      f = { "<cmd>DiffviewFileHistory %<cr>", "Current File" }
    }
  },
  w = {
    name = "Window",
    s = { "<cmd>split<CR>", "Split Window" },
    v = { "<cmd>vsplit<CR>", "VSplit Window" },
    d = { "<cmd>clo<CR>", "Kill Window" },
    h = { "<C-w>h", "Move Left Windows" },
    j = { "<C-w>j", "Move Down Windows" },
    k = { "<C-w>k", "Move Up Windows" },
    l = { "<C-w>l", "Move Right Windows" },
    J = { "<cmd>resize -20<CR>", "Resize Windows Down" },
    K = { "<cmd>resize +20<CR>", "Resize Windows Up" },
    H = { "<cmd>vertical resize +20<CR>", "Resize Window Left" },
    L = { "<cmd>vertical resize -20<CR>", "Resize Window Right" }

  },
  q = {
    name = "Quit",
    q = { "<cmd>confirm q<CR>", "Quit" },
    Q = { "<cmd>:qa!<cr>", "Quit without saving" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    s = { "<cmd>Telescope live_grep<cr>", "Search" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    t = { '<cmd>lua require("telescope.builtin").treesitter()', "Find Symbol" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
    l = { "<cmd>nohlsearch<CR>", "Clear Highlight" }
  },
  p = {
    name = "Project",
    p = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Find Projects" },
    t = { "<cmd>Telescope yabs tasks<CR>", "Tasks" },
    T = { "<cmd>Telescope yabs current_language_tasks<CR>", "Current Tasks" }
  },
  c = {
    name = "Code",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { require("lvim.lsp.utils").format, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
      vim.diagnostic.goto_next,
      "Next Diagnostic",
    },
    g = {
      name = "Goto",
      d = { "<cmd>lua vim.lsp.buf.definition<cr>", "Definition" },
      D = { "<cmd>Telescope lsp_definitions", "Definitions" },
      r = { "<cmd>Telescope lsp_references", "References" },
    },
    k = {
      vim.diagnostic.goto_prev,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    p = {
      name = "Project/Peek",
      p = { "<cmd>Telescope projects<CR>", "Projects" },
      d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
      t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
      i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
    },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    h = { "<cmd>vim.lsp.buf.hover<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },
  o = {
    name = "Open",
    e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
    l = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline" },
    t = {
      name = "Terminal",
      t = { "<cmd>ToggleTerm direction=horizontal<CR>", "Open Terminal(horizontal)" },
      v = { "<cmd>ToggleTerm direction=vertical size=100<CR>", "Open Terminal(vertical)" },
      f = { "<cmd>ToggleTerm direction=float<CR>", "Open Terminal(float)" }
    }
  },
  L = {
    name = "+LunarVim",
    c = {
      "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
      "Edit config.lua",
    },
    f = {
      "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
      "Find LunarVim files",
    },
    g = {
      "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>", "Grep LunarVim files",
    },
    k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
    i = {
      "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
      "Toggle LunarVim Info",
    },
    I = {
      "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
      "View LunarVim's changelog",
    },
    l = {
      name = "+logs",
      d = {
        "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
        "view default log",
      },
      D = {
        "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
        "Open the default logfile",
      },
      l = {
        "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
        "view lsp log",
      },
      L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
      n = {
        "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
        "view neovim log",
      },
      N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
      p = {
        "<cmd>lua require('lvim.core.terminal').toggle_log_view(get_cache_dir() .. '/packer.nvim.log')<cr>",
        "view packer log",
      },
      P = { "<cmd>edit $LUNARVIM_CACHE_DIR/packer.nvim.log<cr>", "Open the Packer logfile" },
    },
    r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
    u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
  },
  j = {
    name = "Jump",
    w = { '<cmd>lua require("flash").jump()<CR>', "Jump World" },
    t = { '<cmd>lua require("flash").treesitter()<CR>', "Jump Treesitter" },
    s = { '<cmd>lua require("flash").treesitter_search()<CR>', "Treesitter Search" },
    S = { '<cmd>lua require("flash").toggle()<CR>', "Search" },
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
  [";"] = {
    name = "Comment",
    [";"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" }
  },
}

return M
