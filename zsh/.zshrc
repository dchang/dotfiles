
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

if hash keychain 2>/dev/null; then
	eval `keychain -q --eval --agents ssh id_rsa`
fi

# variables
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
NVM_LAZY_LOAD=true
SPACESHIP_CHAR_SYMBOL=" "
SPACESHIP_DOCKER_SYMBOL=" "
SPACESHIP_ELIXIR_SYMBOL=" "
[ -f ~/.env ] && . ~/.env

# plugins
hash antibody 2>/dev/null || curl -sL git.io/antibody | sh -s
source <(antibody init)
antibody bundle denysdovhan/spaceship-prompt
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/common-aliases
antibody bundle lukechilds/zsh-nvm

# aliases
case "$OSTYPE" in
	darwin*) alias ls='ls -G' ;;
	linux*) alias ls='ls --color=auto' ;;
esac

