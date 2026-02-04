return {
  -- 1. Tokyo Night (LazyVim default) - already installed
  { "folke/tokyonight.nvim", lazy = true },

  -- 2. Catppuccin - most popular, 4 dark flavors
  { "catppuccin/nvim", name = "catppuccin", lazy = true },

  -- 3. Kanagawa - Japanese painting inspired, beautiful
  { "rebelot/kanagawa.nvim", lazy = true },

  -- 4. Rose Pine - elegant, soft contrast
  { "rose-pine/neovim", name = "rose-pine", lazy = true },

  -- 5. Gruvbox Material - retro, easy on eyes
  { "sainnhe/gruvbox-material", lazy = true },

  -- 6. Nightfox - multiple variants (nightfox, carbonfox, terafox)
  { "EdenEast/nightfox.nvim", lazy = true },

  -- 7. OneDark - Atom inspired
  { "navarasu/onedark.nvim", lazy = true },

  -- 8. Everforest - green-tinted, relaxing
  { "sainnhe/everforest", lazy = true },

  -- 9. Nordic - Nord but better contrast
  { "AlexvZyl/nordic.nvim", lazy = true },

  -- 10. Cyberdream - high contrast, modern
  { "scottmckendry/cyberdream.nvim", lazy = true },

  -- Set your preferred theme here
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "cyberdream" }, -- change this
  },
}
