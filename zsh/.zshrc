# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases comuns
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gb='git branch'

# Aliases Docker
alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcr="docker-compose restart"

# Aliases eza
alias ..='cd ..'
alias c='clear'
alias ll='eza --icons -la'
alias ls='eza --icons'
alias la='eza --icons -a'
alias lt='eza --tree --icons'
alias cat='bat --paging=never'

# Bat
export BAT_THEME="Dracula"

# Ripgrep
alias grep="rg"

 Zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# FZF Configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --color=always {}'"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# FZF
fzf-history() { zle -I; eval $(history | fzf --tac | sed 's/ *[0-9]* *//') }
zle -N fzf-history
bindkey '^R' fzf-history

fzf-cd() { zle -I; cd "$(fd --type d --hidden --follow --exclude .git | fzf)" }
zle -N fzf-cd
bindkey '^F' fzf-cd

# Lazygit alias
alias lg="lazygit"

export PNPM_HOME="/home/khalaf/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}


if [ -d "/usr/local/go/bin" ]; then
  export PATH=$PATH:/usr/local/go/bin
fi
if [ -d "$HOME/go/bin" ]; then
  export PATH=$PATH:$HOME/go/bin
fi


function load_composer() {
  source $ZSH/plugins/composer/composer.plugin.zsh
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Load Angular CLI autocompletion.
# source <(ng completion script)

eval "$(mise activate zsh)"
