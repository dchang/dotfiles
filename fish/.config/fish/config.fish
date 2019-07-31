set -g -x fish_greeting ''

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if type -q keychain
	eval (keychain -q --eval id_rsa)
end

source ~/.profile

