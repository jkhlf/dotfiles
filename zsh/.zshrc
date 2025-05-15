if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="half-life"

# Plugins essenciais apenas
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

# Aliases de navegação
alias ..='cd ..'
alias c='clear'
alias ll='ls -l'
alias cat='bat'


# pnpm - manter se você usar
export PNPM_HOME="/home/khalaf/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Lazy load NVM (carregamento apenas quando necessário)
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# Adicione o Go ao PATH apenas se instalado
if [ -d "/usr/local/go/bin" ]; then
  export PATH=$PATH:/usr/local/go/bin
fi
if [ -d "$HOME/go/bin" ]; then
  export PATH=$PATH:$HOME/go/bin
fi

# Função para carregar plugins extras apenas quando necessários
function load_composer() {
  source $ZSH/plugins/composer/composer.plugin.zsh
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
