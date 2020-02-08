# skim
alias sk='sk --color=fg:8,hl:1,hl+:1'
abbr -a skg 'sk --ansi -ic \'rg --color=ansi --hidden -in "{}"\''

# vim
abbr -a vim nvim
abbr -a v nvim
abbr -a vw 'nvim -c VimwikiIndex -c "cd %:p:h"'
abbr -a vd 'nvim -c VimwikiMakeDiaryNote -c "cd %:p:h"'
abbr -a vrc 'nvim ~/.config/nvim/init.vim -c "cd ~/.config"'
