set -g -x fish_greeting ''

if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx -- -keeptty
  end
end

# skim
alias sk='sk --color=fg:8,hl:1,hl+:1'
abbr -a skg 'sk --ansi -ic \'rg --color=ansi --hidden -in "{}"\''

# vim
abbr -a vim nvim
abbr -a v nvim
abbr -a vw 'nvim -c VimwikiIndex -c "cd %:p:h"'
abbr -a vd 'nvim -c VimwikiMakeDiaryNote -c "cd %:p:h"'
abbr -a vrc 'nvim ~/.config/nvim/init.vim -c "cd ~/.config"'

if test -e ~/.profile
  . ~/.profile
end

