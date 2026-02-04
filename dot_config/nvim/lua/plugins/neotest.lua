-- ~/.config/nvim/lua/plugins/neotest.lua
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
      },
      discovery = {
        filter_dir = function(name)
          local ignore = {
            "node_modules",
            "dist",
            "build",
            "out",
            ".git",
            "coverage",
            ".next",
            ".nuxt",
            ".turbo",
          }
          return not vim.tbl_contains(ignore, name)
        end,
      },
    },
  },
}
