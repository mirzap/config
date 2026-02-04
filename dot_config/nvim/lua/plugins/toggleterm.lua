-- lua/plugins/toggleterm.lua
-- Terminal integration with Codex CLI support

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<c-\\>", desc = "Toggle Terminal" },
    { "<leader>tC", "<cmd>Codex<cr>", desc = "Toggle Codex Terminal" },
  },
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    direction = "horizontal",
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Codex CLI integration
    local ok, project = pcall(require, "util.project")
    local root = ok and project.root() or vim.fn.getcwd()

    -- Check if codex is available
    local codex_available = vim.fn.executable("codex") == 1

    -- Create Codex terminal instance
    local Terminal = require("toggleterm.terminal").Terminal
    local codex_term = nil

    if codex_available then
      codex_term = Terminal:new({
        cmd = "codex",
        dir = root,
        direction = "float",
        float_opts = {
          border = "curved",
          width = math.floor(vim.o.columns * 0.85),
          height = math.floor(vim.o.lines * 0.85),
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          -- Close with q in normal mode
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })
    end

    -- User command to toggle Codex
    vim.api.nvim_create_user_command("Codex", function()
      if not codex_available then
        vim.notify("codex not found in PATH", vim.log.levels.WARN)
        return
      end
      if codex_term then
        codex_term:toggle()
      end
    end, { desc = "Toggle Codex terminal" })
  end,
}
