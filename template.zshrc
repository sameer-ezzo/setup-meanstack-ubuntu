source /usr/share/zsh-antigen/antigen.zsh
export SHELL=/bin/zsh

export PATH=$HOME/bin:/usr/local/bin:/$HOME/.local/bin:$PATH
export NVM_DIR=$HOME/.nvm
# https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
# Load custom aliases

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# Zsh history configuration
export PROMPT_COMMAND="history -a"
export HISTFILE="$HOME/zsh_history/.zsh_history"


zmodload zsh/zprof

antigen bundle lukechilds/zsh-nvm
antigen bundle Sparragus/zsh-auto-nvm-use

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle thefuck
antigen theme awesomepanda
antigen bundle npm
antigen bundle history
antigen bundle colorize
antigen theme robbyrussell
antigen theme awesomepanda

antigen apply

eval $(thefuck --alias)
