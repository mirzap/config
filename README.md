# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Install

### macOS

```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install chezmoi and apply dotfiles
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply mirzap/config
```

### Linux (Arch/Omarchy)

```bash
# Install chezmoi
sudo pacman -S chezmoi

# Apply dotfiles
chezmoi init --apply mirzap/config
```

### Linux (Ubuntu/Debian)

```bash
# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"

# Apply dotfiles
chezmoi init --apply mirzap/config
```

## What's Included

| Component      | Description                                       |
| -------------- | ------------------------------------------------- |
| **Fish Shell** | Modern shell with aliases, functions, and plugins |
| **Neovim**     | LazyVim configuration                             |
| **Tmux**       | Terminal multiplexer config                       |
| **Git**        | Global config with delta pager                    |

### Fish Shell Details

- `config.fish` - Main config (conda, zoxide, starship, bun)
- `conf.d/paths.fish` - Platform-specific PATH entries
- `conf.d/env.fish` - Environment variables
- `conf.d/zzz-aliases.fish` - Modern CLI aliases
- `functions/claude-*.fish` - Claude Code provider switching
- `TOOLS.md` - CLI tools documentation

## Post-Install Setup

### Step 1: Install Fish Shell

**macOS:**

```bash
brew install fish

# Add to allowed shells
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells

# Set as default
chsh -s /opt/homebrew/bin/fish
```

**Arch Linux:**

```bash
sudo pacman -S fish

# Add to allowed shells
echo /usr/bin/fish | sudo tee -a /etc/shells

# Set as default
chsh -s /usr/bin/fish
```

### Step 2: Install Fisher (Plugin Manager)

```bash
# Start fish first
fish

# Install Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install plugins from fish_plugins file
fisher update
```

### Step 3: Install CLI Tools

**macOS (Homebrew):**

```bash
# Core tools (required for aliases to work)
brew install eza bat ripgrep fd zoxide starship fzf

# Editor
brew install neovim tmux

# Git tools
brew install git-delta lazygit

# System monitoring
brew install btop dust duf procs

# Extras
brew install lazydocker fastfetch tldr yq mise hyperfine tokei sd ncdu
```

**Arch Linux (pacman + AUR):**

```bash
# Core tools
sudo pacman -S eza bat ripgrep fd zoxide starship fzf

# Editor
sudo pacman -S neovim tmux

# Git tools
sudo pacman -S git-delta lazygit

# System monitoring
sudo pacman -S btop dust duf procs

# Extras (some may need AUR helper like yay)
sudo pacman -S fastfetch tldr
yay -S lazydocker
```

**Ubuntu/Debian:**

```bash
# Add repositories and install (some tools need cargo or manual install)
sudo apt install bat ripgrep fd-find fzf neovim tmux

# Install via cargo
cargo install eza zoxide starship git-delta

# Or use Homebrew on Linux
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install eza bat ripgrep fd zoxide starship fzf git-delta lazygit btop
```

### Step 4: Generate Completions

```bash
# Bun (if installed)
bun completions > ~/.config/fish/completions/bun.fish

# Other tools generate completions automatically via Fisher plugins
```

### Step 5: Create Secrets File

```bash
cp ~/.config/fish/conf.d/secrets.fish.example ~/.config/fish/conf.d/secrets.fish
# Edit with your API tokens
nvim ~/.config/fish/conf.d/secrets.fish
```

### Step 6: Install Optional Tools

**SDKMAN (Java/Kotlin/Gradle):**

```bash
curl -s "https://get.sdkman.io" | bash
# Restart shell, then Fisher will load the sdk plugin
```

**NVM (Node.js) - handled by Fisher plugin:**

```bash
# Just use nvm commands - Fisher plugin manages it
nvm install lts
```

**Bun:**

```bash
curl -fsSL https://bun.sh/install | bash
```

**Turso (SQLite edge database):**

```bash
curl -sSfL https://get.tur.so/install.sh | bash
```

**uv (Python package manager):**

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Updating Dotfiles

```bash
# Pull and apply latest changes
chezmoi update

# Or step by step
chezmoi git pull
chezmoi diff    # Review changes
chezmoi apply   # Apply changes
```

## CLI Aliases Reference

| Alias              | Tool       | Purpose                  |
| ------------------ | ---------- | ------------------------ |
| `ls`, `ll`, `la`   | eza        | Modern ls with icons     |
| `lt`, `lt2`, `lt3` | eza        | Tree view (1/2/3 levels) |
| `cat`              | bat        | Syntax highlighting      |
| `grep`             | ripgrep    | Fast regex search        |
| `find`             | fd         | Fast file finder         |
| `cd`               | zoxide     | Smart directory jumping  |
| `vim`, `vi`        | nvim       | Neovim                   |
| `top`, `htop`      | btop       | Resource monitor         |
| `du`               | dust       | Disk usage analyzer      |
| `df`               | duf        | Disk free (prettier)     |
| `ps`               | procs      | Process viewer           |
| `lg`               | lazygit    | Git TUI                  |
| `lzd`              | lazydocker | Docker TUI               |
| `help`             | tldr       | Command examples         |
| `sysinfo`          | fastfetch  | System info              |

## Git Aliases (from plugin-git)

Common ones:
| Alias | Command |
|-------|---------|
| `g` | `git` |
| `ga` | `git add` |
| `gaa` | `git add --all` |
| `gc` | `git commit -v` |
| `gcmsg` | `git commit -m` |
| `gco` | `git checkout` |
| `gd` | `git diff` |
| `gds` | `git diff --staged` |
| `gl` | `git pull` |
| `gp` | `git push` |
| `gst` | `git status` |
| `gsw` | `git switch` |
| `gswc` | `git switch -c` |

See full list: `abbr | grep git` or check plugin-git docs.

## Platform-Specific Notes

### macOS

- Uses Homebrew paths (`/opt/homebrew/bin`)
- OrbStack integration for Docker
- LM Studio CLI support

### Linux (Arch/Omarchy)

- Uses system paths (`/usr/bin`)
- Standard pacman packages

## Troubleshooting

**Aliases not working:**

```bash
# Reload fish config
source ~/.config/fish/config.fish

# Or restart fish
exec fish
```

**Fisher plugins not loading:**

```bash
fisher update
```

**Starship prompt not showing:**

```bash
# Check if installed
starship --version

# Reinstall if needed
brew install starship  # macOS
sudo pacman -S starship  # Arch
```

**Zoxide not working:**

```bash
# Initialize database
zoxide init fish | source

# Check if working
z --help
```

## File Locations

| File                             | Purpose                 |
| -------------------------------- | ----------------------- |
| `~/.config/chezmoi/chezmoi.toml` | Chezmoi config          |
| `~/.config/fish/`                | Fish shell config       |
| `~/.config/nvim/`                | Neovim config           |
| `~/.tmux.conf`                   | Tmux config             |
| `~/.gitconfig`                   | Git config              |
| `~/.config/fish/TOOLS.md`        | CLI tools documentation |

## Contributing

Edit files in `~/.local/share/chezmoi/`, then:

```bash
chezmoi diff      # Review changes
chezmoi apply     # Test locally
chezmoi cd        # Go to source dir
git add -A && git commit -m "Description"
git push
```
