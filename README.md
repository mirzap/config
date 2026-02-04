# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Install

On a new machine:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply mirzap/config
```

Or if chezmoi is already installed:

```bash
chezmoi init --apply mirzap/config
```

## What's Included

### Shell (Fish)

- `config.fish` - Main config with conda, zoxide, starship, bun
- `conf.d/paths.fish` - Platform-specific PATH entries
- `conf.d/env.fish` - Environment variables
- `conf.d/zzz-aliases.fish` - Modern CLI aliases (eza, bat, ripgrep, etc.)
- `functions/claude-*.fish` - Claude Code provider switching functions
- `TOOLS.md` - Documentation for all CLI tools

### Editor (Neovim)

- Full LazyVim configuration

### Terminal

- `tmux.conf` - Tmux configuration

### Git

- `gitconfig` - Git configuration with delta pager
- `gitignore_global` - Global gitignore patterns

## Post-Install Setup

### 1. Install Fisher plugins

```bash
fisher update
```

### 2. Create secrets file

```bash
cp ~/.config/fish/conf.d/secrets.fish.example ~/.config/fish/conf.d/secrets.fish
# Edit secrets.fish with your API tokens
```

### 3. Install CLI tools

**macOS (Homebrew):**

```bash
brew install fish eza bat ripgrep fd git-delta lazygit lazydocker \
  btop dust fastfetch tldr zoxide starship fzf nvim tmux \
  yq mise hyperfine tokei procs sd duf ncdu
```

**Linux (Arch/pacman):**

```bash
sudo pacman -S fish eza bat ripgrep fd git-delta lazygit \
  btop dust fastfetch tldr zoxide starship fzf neovim tmux
```

### 4. Set Fish as default shell

```bash
# Add fish to shells (if needed)
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells  # macOS
echo /usr/bin/fish | sudo tee -a /etc/shells           # Linux

# Change shell
chsh -s $(which fish)
```

## Platform Support

- macOS (Apple Silicon)
- Linux (Arch/Omarchy)

Templates automatically handle platform-specific configurations.

## Updating

Pull latest changes:

```bash
chezmoi update
```

## CLI Aliases

| Alias            | Tool       | Purpose                 |
| ---------------- | ---------- | ----------------------- |
| `ls`, `ll`, `la` | eza        | Modern ls replacement   |
| `cat`            | bat        | Syntax highlighting     |
| `grep`           | ripgrep    | Fast search             |
| `find`           | fd         | Fast find               |
| `cd`             | zoxide     | Smart directory jumping |
| `vim`            | nvim       | Neovim                  |
| `top`            | btop       | Resource monitor        |
| `du`             | dust       | Disk usage              |
| `df`             | duf        | Disk free               |
| `lg`             | lazygit    | Git TUI                 |
| `lzd`            | lazydocker | Docker TUI              |
| `help`           | tldr       | Command examples        |

See `~/.config/fish/TOOLS.md` for full documentation.
