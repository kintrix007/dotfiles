# .bash_aliases

# Some generic useful aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lA'

# Git aliases
alias ga='git add'
alias gs='git status'
# alias gd='git diff'

# XBPS aliases
# alias xi='sudo xbps-install'	# Use '\xi' for 'xi' from 'xtools'
# alias xq='xbps-query'		# Use '\xq' for 'xq' from 'xtools'
# alias xr='sudo xbps-remove'
# alias copy='wl-copy'

# Funi
idot() {
    if which cowsay >/dev/null 2>&1; then
        cowsay "n00b" 2>/dev/null
    else
        echo "n00b"
    fi
    false
}

alias :q='idot'
alias :wq='idot'

alias nix-pd='nix develop github:headblockhead/nix-playdatesdk && echo'
alias nix-shell-unstable='nix-shell -I https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz'

alias espresso='wine ~/bin/espresso/bin/espresso.exe'
alias espresso-gui='wine ~/bin/espresso/espresso-gui.exe'

alias tmpd='cd $(mktemp -d)'
alias tmp.hs='nix-shell -p ghc haskell-language-server --command "cd \"$(mktemp -d)\" && touch Main.hs; return"'
alias tmp.gd='nix-shell -p godot_4 --command "cd \"$(mktemp -d)\" && cat <<EOF > main.gd
#!/usr/bin/env -S godot4 --headless --script

extends MainLoop

func _initialize() -> void:
	print(\"Started.\")

func _process(delta: float) -> bool:
	return true

func _finalize() -> void:
	print(\"Exited.\")
EOF
return"'
