# zsh-specific configuration
export ZSH="/home/${USER}/.oh-my-zsh"
ZSH_THEME="gallifrey"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# shell environment configuration
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

export PYENV_ROOT="$HOME"/.pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}
if command -v pyenv 1>/dev/null 2>&1;
then
    eval "$(pyenv init -)"
fi

command -v rustc 1>/dev/null 2>&1
if [ $? -eq 1 ];
then
    [ -s "${HOME}/.cargo/bin/rustc" ] && export PATH=${PATH}:${HOME}/.cargo/bin
fi

# host-specific settings
export PYENV_VERSION=3.8.3
export DISPLAY=:0

