# zsh-specific configuration
export ZSH="/home/${USER}/.oh-my-zsh"
ZSH_THEME="gallifrey"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# shell environment configuration

export PATH=$HOME/.local/bin:$PATH

export EDITOR='vi'
if [ -f "${HOME}/.local/bin/nvim" ]; then
    alias vim="nvim"
    export EDITOR='nvim'
fi

if [ -d "${HOME}/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CARGO_DIR="${HOME}/.cargo"
export PATH="${CARGO_DIR}/bin:${PATH}"
