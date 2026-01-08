# ---------------------------------------------------------
# Powerlevel10k instant prompt (must stay at top)
# ---------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------------------------------------------
# Environment / PATH setup
# ---------------------------------------------------------
export PATH="/opt/homebrew/bin:$PATH"

# Perl local libs
export PATH="/Users/cargan/perl5/bin:$PATH"
export PERL5LIB="/Users/cargan/perl5/lib/perl5:$PERL5LIB"
export PERL_LOCAL_LIB_ROOT="/Users/cargan/perl5:$PERL_LOCAL_LIB_ROOT"
export PERL_MB_OPT="--install_base \"/Users/cargan/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/Users/cargan/perl5"

# pyenv
export PYENV_ROOT="/opt/homebrew/bin/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# bun (clean, no duplicates)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# VCPKG
export VCPKG_ROOT="$HOME/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"

# Vulkan SDK
if [[ $(uname -m) == "arm64" ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
else
  export HOMEBREW_PREFIX="/usr/local"
fi
export VULKAN_SDK="$HOMEBREW_PREFIX"
export VK_ICD_FILENAMES="$HOMEBREW_PREFIX/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$HOMEBREW_PREFIX/share/vulkan/explicit_layer.d"
export DYLD_LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$DYLD_LIBRARY_PATH"

# ---------------------------------------------------------
# Oh My Zsh + Theme + Plugins
# ---------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Powerlevel10k config (prompt appearance)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---------------------------------------------------------
# Tools (must load *after* oh-my-zsh)
# ---------------------------------------------------------
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(thefuck --alias)"

# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------
alias python=python3
alias cat='bat'
alias ls='eza --icons'
alias ll='eza -la --icons'
alias la='eza -a --icons'
alias lt='eza --tree --icons'
alias grep='rg'
alias find='fd'
alias vim='nvim'
alias lg='lazygit'

alias gst='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# ---------------------------------------------------------
# History Search with Up/Down
# ---------------------------------------------------------
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# ---------------------------------------------------------
# fzf helpers
# ---------------------------------------------------------
fcd() { local dir; dir=$(fd --type d | fzf --preview "eza --tree --level=2 --icons {}") && cd "$dir"; }
fv() { local file; file=$(fd --type f | fzf --preview "bat --color=always {}") && nvim "$file"; }