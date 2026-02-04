local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Detect project languages for conditional loading
local ok, project = pcall(require, "util.project")
local detected = ok and project.detect_languages() or {}

-- Build language imports dynamically
-- Always-on: lightweight/common extras
local lang_imports = {
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.docker" },
}

-- Conditional: heavy language extras (only when project detected, or fallback to all)
local has_any_detection = next(detected) ~= nil

-- If no markers detected, load all (safe fallback to preserve current behavior)
-- Otherwise, load only detected languages
-- Java: using nvim-java instead of LazyVim extra (see plugins/java.lua)
if not has_any_detection or detected.node then
  table.insert(lang_imports, { import = "lazyvim.plugins.extras.lang.typescript" })
end
if not has_any_detection or detected.python then
  table.insert(lang_imports, { import = "lazyvim.plugins.extras.lang.python" })
end
if not has_any_detection or detected.clang then
  table.insert(lang_imports, { import = "lazyvim.plugins.extras.lang.clangd" })
end
if not has_any_detection or detected.rust then
  table.insert(lang_imports, { import = "lazyvim.plugins.extras.lang.rust" })
end
if not has_any_detection or detected.go then
  table.insert(lang_imports, { import = "lazyvim.plugins.extras.lang.go" })
end
if not has_any_detection or detected.terraform then
  table.insert(lang_imports, { import = "lazyvim.plugins.extras.lang.terraform" })
end

-- Build the full spec
local spec = {
  -- add LazyVim and import its plugins
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
}

-- Add language imports
for _, lang in ipairs(lang_imports) do
  table.insert(spec, lang)
end

-- Add remaining imports
vim.list_extend(spec, {
  -- AI
  { import = "lazyvim.plugins.extras.ai.claudecode" },

  -- Dev tools
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.test.core" },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- Editor enhancements
  { import = "lazyvim.plugins.extras.editor.telescope" },
  { import = "lazyvim.plugins.extras.coding.mini-surround" },

  -- User plugins (must be last)
  { import = "plugins" },
})

require("lazy").setup({
  spec = spec,
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
