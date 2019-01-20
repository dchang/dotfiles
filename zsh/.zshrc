# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

eval `keychain -q --eval --agents ssh id_rsa`

zstyle :compinstall filename '/home/dchang/.zshrc'

autoload -Uz compinit && compinit
autoload -Uz is-at-least # oh-my-zsh plugins/common-aliases dependency

setopt autocd

alias ls='ls --color=always'
alias la='ls -la'
alias tree='tree -C'

source <(antibody init)
antibody bundle denysdovhan/spaceship-prompt
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/common-aliases

SPACESHIP_DOCKER_SYMBOL=" "
SPACESHIP_ELIXIR_SYMBOL=" "

source /usr/share/nvm/init-nvm.sh

