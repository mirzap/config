-- lua/plugins/extras.lua
-- Additional plugins for a mixed development workflow

return {
  -- Harpoon: Quick file switching (mark frequently used files)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon Add File" },
      { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon File 1" },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon File 2" },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon File 3" },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon File 4" },
    },
    opts = {},
  },

  -- Trouble: Better diagnostics/quickfix list
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix (Trouble)" },
    },
    opts = {},
  },

  -- Spectre: Search and replace across files
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Search & Replace (Spectre)" },
      { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search Current Word" },
    },
  },

  -- Undotree: Visual undo history
  {
    "mbbill/undotree",
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    },
  },

  -- Zen mode: Distraction-free coding
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
      window = { width = 120 },
    },
  },

  -- Better quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {},
  },

  -- Git signs enhancements (blame line, etc.)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false, -- Toggle with :Gitsigns toggle_current_line_blame
    },
    keys = {
      { "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Line Blame" },
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
    },
  },

  -- Todo comments: Highlight TODO, FIXME, etc.
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search Todos" },
    },
  },

  -- Neogen: Generate documentation/annotations
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      { "<leader>cg", "<cmd>Neogen<cr>", desc = "Generate Docs" },
    },
    opts = {
      snippet_engine = "nvim",
    },
  },
}
