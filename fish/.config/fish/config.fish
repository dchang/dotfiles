set -g -x fish_greeting ''

if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

fish_add_path $HOME/bin
fish_add_path $HOME/.cargo/bin

# abbrs
abbr -a f 'find . | rg'
abbr -a h 'history | rg'
abbr -a mkdir 'mkdir -pv'
abbr -a v nvim
abbr -a vw 'nvim -c VimwikiIndex -c "cd %:p:h"'
abbr -a vd 'nvim -c VimwikiMakeDiaryNote -c "cd %:p:h"'
abbr -a vcv 'nvim ~/.vimrc -c "cd ~/.vim"'
abbr -a vcf 'nvim ~/.config/fish/config.fish -c "cd %:p:h"'
abbr -a c cargo
abbr -a tldrf 'tldr -l | fzf --preview "tldr {1} --color=always" --preview-window=right,80% | xargs tldr'

eval (keychain -q --eval id_ed25519)
