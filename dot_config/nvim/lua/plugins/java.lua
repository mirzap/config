-- lua/plugins/java.lua
-- nvim-java configuration for LazyVim (official setup)

return {
  "nvim-java/nvim-java",
  config = false, -- Important: let lspconfig handle setup
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            -- jdtls settings (managed by nvim-java, not mason)
            mason = false,
          },
        },
        setup = {
          jdtls = function()
            require("java").setup({
              -- nvim-java configuration
              jdk = { auto_install = false },
              spring_boot_tools = { enable = true },
              java_test = { enable = true },
              java_debug_adapter = { enable = true },
            })
          end,
        },
      },
    },
  },
  keys = {
    -- Testing
    { "<leader>Jt", "<cmd>JavaTestRunCurrentClass<cr>", desc = "Run Test Class", ft = "java" },
    { "<leader>Jm", "<cmd>JavaTestRunCurrentMethod<cr>", desc = "Run Test Method", ft = "java" },
    { "<leader>JM", "<cmd>JavaTestDebugCurrentMethod<cr>", desc = "Debug Test Method", ft = "java" },
    { "<leader>Jv", "<cmd>JavaTestViewLastReport<cr>", desc = "View Test Report", ft = "java" },
    -- Running
    { "<leader>Jr", "<cmd>JavaRunnerRunMain<cr>", desc = "Run Main", ft = "java" },
    { "<leader>Js", "<cmd>JavaRunnerStopMain<cr>", desc = "Stop Main", ft = "java" },
    { "<leader>Jl", "<cmd>JavaRunnerToggleLogs<cr>", desc = "Toggle Logs", ft = "java" },
    -- Building
    { "<leader>Jb", "<cmd>JavaBuildBuildWorkspace<cr>", desc = "Build Workspace", ft = "java" },
    { "<leader>JB", "<cmd>JavaBuildCleanWorkspace<cr>", desc = "Clean Workspace", ft = "java" },
    -- Refactoring
    { "<leader>Jev", "<cmd>JavaRefactorExtractVariable<cr>", desc = "Extract Variable", ft = "java" },
    { "<leader>Jec", "<cmd>JavaRefactorExtractConstant<cr>", desc = "Extract Constant", ft = "java" },
    { "<leader>Jem", "<cmd>JavaRefactorExtractMethod<cr>", desc = "Extract Method", ft = "java" },
    { "<leader>Jef", "<cmd>JavaRefactorExtractField<cr>", desc = "Extract Field", ft = "java" },
    -- Settings
    { "<leader>Jp", "<cmd>JavaProfile<cr>", desc = "Spring Profiles", ft = "java" },
    { "<leader>JR", "<cmd>JavaSettingsChangeRuntime<cr>", desc = "Change Runtime", ft = "java" },
  },
}
