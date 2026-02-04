# Tool replacement aliases (matching zsh config)
# Using modern CLI replacements

# eza instead of ls (modern ls with icons and git integration)
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"
alias lt="eza --tree"
alias lt2="eza --tree -L 2"
alias lt3="eza --tree -L 3"
alias lta="eza --tree -a"
alias ltl="eza --tree -l"
alias tree="eza --tree"

# fd instead of find (faster, more intuitive find)
alias find="fd"

# nvim instead of vim
alias vim="nvim"
alias vi="nvim"

# Better 'which' that shows fish functions/aliases
# Use 'type' in fish to see function definitions
alias which="type"

# Git aliases that conflict with or are missing from fish plugin
# These override the fish plugin abbreviations to match oh-my-zsh

# Fix conflicts: gcm should be checkout main, not commit -m
# In fish plugin: gcm = 'git commit -m' (WRONG for oh-my-zsh users)
# We use gcom for checkout main (fish plugin already has this)
# Adding gcmsg for commit message (oh-my-zsh style)
abbr -a gcmsg 'git commit -m'

# Fix: gds should be git diff --staged, not --stat
abbr -a gds 'git diff --staged'
abbr -a gdst 'git diff --stat'

# Missing from fish plugin (oh-my-zsh has these)
abbr -a gav 'git add --verbose'
abbr -a gcd 'git checkout develop'
abbr -a gpr 'git pull --rebase'
abbr -a gpra 'git pull --rebase --autostash'
abbr -a gprav 'git pull --rebase --autostash -v'
abbr -a gprv 'git pull --rebase -v'
abbr -a gpf 'git push --force-with-lease'
abbr -a gpf! 'git push --force'
abbr -a gstaa 'git stash apply'
abbr -a gstall 'git stash --all'
abbr -a ggpull 'git pull origin (git branch --show-current)'
abbr -a ggpush 'git push origin (git branch --show-current)'

# Additional useful oh-my-zsh aliases
abbr -a gapa 'git add --patch'
abbr -a groh 'git reset origin/(git branch --show-current) --hard'
abbr -a grhh 'git reset --hard'
abbr -a grhs 'git reset --soft'
abbr -a gpristine 'git reset --hard && git clean --force -dfx'
abbr -a gwipe 'git reset --hard && git clean --force -df'

# Pretty log formats (oh-my-zsh style)
abbr -a glol "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
abbr -a glols "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
abbr -a glola "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
abbr -a glods "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"

# Revert
abbr -a greva 'git revert --abort'
abbr -a grevc 'git revert --continue'

# Worktree (some missing)
abbr -a gwtpr 'git worktree prune'

# ============================================
# Modern CLI Tool Aliases (Omarchy-inspired)
# ============================================

# bat - better cat with syntax highlighting
alias cat="bat --paging=never"
alias catp="bat"  # bat with pager

# lazygit - TUI for git
alias lg="lazygit"

# lazydocker - TUI for Docker
alias lzd="lazydocker"

# btop - better top/htop
alias top="btop"
alias htop="btop"

# procs - better ps
alias ps="procs"
alias pst="procs --tree"

# dust - better du
alias du="dust"

# duf - better df  
alias df="duf"

# ripgrep - better grep (rg is already short)
alias grep="rg"

# tldr - simplified man pages
alias help="tldr"

# fastfetch - system info
alias neofetch="fastfetch"
alias sysinfo="fastfetch"
