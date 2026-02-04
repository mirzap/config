# Terminal Tools Reference

A curated collection of modern CLI tools inspired by Omarchy, configured for fish shell on macOS.

## File & Directory Tools

| Command | Replaces | Description                       | Example                  |
| ------- | -------- | --------------------------------- | ------------------------ |
| `ls`    | ls       | Modern ls with icons & git status | `ls -la`                 |
| `ll`    | ls -l    | Long listing                      | `ll`                     |
| `la`    | ls -la   | Long + hidden                     | `la`                     |
| `lt`    | tree     | Tree view                         | `lt`, `lt2`, `lt3`       |
| `tree`  | tree     | Tree view (alias)                 | `tree -L 2`              |
| `find`  | find     | Faster, simpler find              | `find .rs` (finds \*.rs) |
| `fd`    | find     | Same as above                     | `fd -e js`               |
| `dust`  | du       | Intuitive disk usage              | `dust`, `dust -d 2`      |
| `duf`   | df       | Better disk free                  | `duf`                    |
| `ncdu`  | du       | Interactive disk usage            | `ncdu /path`             |

## Text & Search Tools

| Command | Replaces | Description                  | Example                 |
| ------- | -------- | ---------------------------- | ----------------------- |
| `bat`   | cat      | Cat with syntax highlighting | `bat file.py`           |
| `cat`   | -        | Alias to bat                 | `cat file.js`           |
| `rg`    | grep     | Fastest grep (ripgrep)       | `rg "pattern"`          |
| `sd`    | sed      | Intuitive find & replace     | `sd 'old' 'new' file`   |
| `jq`    | -        | JSON processor               | `cat file.json \| jq .` |
| `yq`    | -        | YAML processor               | `yq '.key' file.yaml`   |

## Git Tools

| Command   | Description            | Example           |
| --------- | ---------------------- | ----------------- |
| `lazygit` | TUI for git (amazing!) | `lg` or `lazygit` |
| `delta`   | Better git diff pager  | Auto-used by git  |
| `gst`     | git status             | Abbreviation      |
| `gco`     | git checkout           | Abbreviation      |
| `gp`      | git push               | Abbreviation      |
| `gl`      | git pull               | Abbreviation      |
| 190+ more | See `abbr \| grep git` |                   |

## Docker Tools

| Command      | Description    | Example               |
| ------------ | -------------- | --------------------- |
| `lazydocker` | TUI for Docker | `lzd` or `lazydocker` |

## System Monitoring

| Command     | Replaces | Description              | Example               |
| ----------- | -------- | ------------------------ | --------------------- |
| `btop`      | htop/top | Beautiful system monitor | `btop`                |
| `procs`     | ps       | Modern process viewer    | `procs`, `procs node` |
| `fastfetch` | neofetch | System info display      | `fastfetch`           |

## Development Tools

| Command     | Description              | Example                   |
| ----------- | ------------------------ | ------------------------- |
| `mise`      | Dev tool version manager | `mise use node@20`        |
| `tokei`     | Code statistics          | `tokei .`                 |
| `hyperfine` | Command benchmarking     | `hyperfine 'cmd1' 'cmd2'` |
| `tldr`      | Simplified man pages     | `tldr tar`                |
| `httpie`    | Better curl              | `http GET api.com/users`  |

## Shell & Navigation

| Command | Replaces | Description             | Example              |
| ------- | -------- | ----------------------- | -------------------- |
| `cd`    | cd       | Smart jump (zoxide)     | `cd proj` (fuzzy)    |
| `z`     | cd       | Same as cd              | `z downloads`        |
| `fzf`   | -        | Fuzzy finder            | `Ctrl+R` for history |
| `gum`   | -        | Glamorous shell prompts | For scripts          |

## Editors

| Command | Replaces | Description |
| ------- | -------- | ----------- |
| `vim`   | vim      | Neovim      |
| `vi`    | vi       | Neovim      |
| `nvim`  | -        | Neovim      |

## Claude Code Providers

| Command            | Description                            |
| ------------------ | -------------------------------------- |
| `claude-anthropic` | Switch to Anthropic (default) & launch |
| `claude-zai`       | Switch to Z.ai provider & launch       |
| `claude-kimi`      | Switch to Kimi provider & launch       |
| `claude-status`    | Check current provider config          |

---

## Quick Reference - Common Workflows

### Find files containing text

```fish
rg "TODO" --type py           # Search in Python files
rg "function" -g "*.js"       # Search in JS files
fd -e ts | xargs rg "import"  # Find TS files, search for imports
```

### Disk usage analysis

```fish
dust                          # Current directory
dust -d 2 /path               # Depth 2
ncdu /                        # Interactive
duf                           # All mounted drives
```

### Git workflow

```fish
lg                            # Open lazygit TUI
gst                           # Quick status
gaa && gcmsg "message"        # Stage all & commit
gp                            # Push
```

### Docker management

```fish
lzd                           # Open lazydocker TUI
```

### System monitoring

```fish
btop                          # Full system monitor
procs                         # Process list
procs --tree                  # Process tree
fastfetch                     # System info
```

### Benchmarking

```fish
hyperfine 'fd .' 'find .'     # Compare fd vs find speed
hyperfine --warmup 3 'cmd'    # With warmup runs
```

---

## Installation

All tools installed via Homebrew:

```bash
# Core replacements
brew install eza fd bat ripgrep zoxide fzf starship

# Git/Docker TUIs
brew install lazygit lazydocker git-delta

# System tools
brew install btop dust duf ncdu procs fastfetch

# Dev tools
brew install mise tokei hyperfine tldr jq yq httpie sd gum
```

## Configuration Location

- Fish config: `~/.config/fish/config.fish`
- Aliases: `~/.config/fish/conf.d/zzz-aliases.fish`
- This doc: `~/.config/fish/TOOLS.md`
