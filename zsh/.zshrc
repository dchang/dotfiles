
setopt autocd
setopt extendedglob
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

bindkey -e

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit && compinit
autoload -Uz is-at-least # oh-my-zsh plugins/common-aliases dependency

eval `keychain -q --eval --agents ssh id_rsa`

# variables
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
NVM_LAZY_LOAD=true
SPACESHIP_DOCKER_SYMBOL=" "
SPACESHIP_ELIXIR_SYMBOL=" "

# plugins
source <(antibody init)
antibody bundle denysdovhan/spaceship-prompt
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/common-aliases
antibody bundle lukechilds/zsh-nvm

# aliases
alias ls='ls --color=always'
alias la='ls -la'
alias tree='tree -C'

