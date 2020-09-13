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

set -x FZF_DEFAULT_COMMAND 'fd -H -tf -E.git -Enode_modules -Etarget'

# fix small fzf delay caused by fish shell
alias fzf 'SHELL=bash command fzf'
alias nvim 'SHELL=bash command nvim'

# vim
abbr -a v nvim
abbr -a vw 'nvim -c VimwikiIndex -c "cd %:p:h"'
abbr -a vd 'nvim -c VimwikiMakeDiaryNote -c "cd %:p:h"'
abbr -a vcv 'nvim ~/.vim/vimrc -c "cd %:p:h"'
abbr -a vcf 'nvim ~/.config/fish/config.fish -c "cd %:p:h"'

# rust
abbr -a c cargo

eval (keychain -q --eval id_rsa)

if test -e ~/.profile
  . ~/.profile
end

