# 1. Powerlevel10k instant prompt (Must stay at top)
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# 2. Paths and Environment
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/libarchive/bin:$PATH"
export LD_LIBRARY_PATH="/opt/homebrew/opt/llvm/lib:$LD_LIBRARY_PATH"
export PATH="/opt/ClangBuildAnalyzer/:$PATH"

eval "$(pyenv init --path)"
export BAT_THEME=gruvbox-dark

# 3. Aliases
alias vim=nvim
alias gap="git add -p"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpu="git pull"
alias gck="git checkout"

# 4. Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# 5. Auto-Tmux
if [ -z "$TMUX" ]; then
  exec arch -arm64 tmux
fi

# 6. Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="geoffgarside"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# 7. Zsh Internals
autoload -Uz compinit
compinit -d ~/.config/zsh/.zcompdump
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"

# 8. Tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# 9. P10K Config (This brings back your Name/RAM usage)
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
