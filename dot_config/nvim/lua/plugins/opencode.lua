-- lua/plugins/opencode.lua
return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    vim.g.opencode_opts = {}
    vim.o.autoread = true -- reload files when opencode edits them

    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask OpenCode" })

    vim.keymap.set({ "n", "t" }, "<leader>oo", function()
      require("opencode").toggle()
    end, { desc = "Toggle OpenCode" })

    vim.keymap.set({ "n", "x" }, "<leader>os", function()
      require("opencode").select()
    end, { desc = "OpenCode actions" })
  end,
}
