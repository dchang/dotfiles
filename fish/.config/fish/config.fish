if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -gx fish_greeting ''
set -x EDITOR nvim
set -x BUN_INSTALL "$HOME/.bun"

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $BUN_INSTALL/bin

if type -q $HOME/bin/homebrew/bin/brew
    eval ($HOME/bin/homebrew/bin/brew shellenv)
end

abbr -a f 'find . | rg'
abbr -a h 'history | rg'
abbr -a mkdir 'mkdir -pv'
abbr -a v nvim
abbr -a vw 'nvim -c "cd ~/Documents/wiki/"'
abbr -a vcf 'nvim ~/.config/fish/config.fish -c "cd %:p:h"'
abbr -a c cargo
abbr -a ccl 'cargo clippy'
abbr -a ce 'RUST_LOG=debug cargo r --example'
abbr -a cr 'RUST_LOG=debug cargo r --'
abbr -a ct 'cargo t --'
abbr -a cu 'cargo update'
abbr -a tldrf 'tldr -l | fzf --preview "tldr {1} --color=always" --preview-window=right,80% | xargs tldr'

eval (keychain -q --eval id_ed25519)

if grep WSL2 /proc/version >/dev/null
    set -x WGPU_BACKEND vulkan
    set -x BROWSER wslview
    set -x VAGRANT_WSL_ENABLE_WINDOWS_ACCESS 1
    fish_add_path "/mnt/c/Program Files/Oracle/VirtualBox"
end
