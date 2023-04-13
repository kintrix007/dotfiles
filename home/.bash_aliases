# .bash_aliases

# Some generic useful aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lA'

# XBPS aliases
alias xi='sudo xbps-install'	# Use '\xi' for 'xi' from 'xtools'
alias xq='xbps-query'		# Use '\xq' for 'xq' from 'xtools'
alias xr='sudo xbps-remove'

# Git aliases
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push'
alias gss='git status'

# For neovim
alias vim='nvim'

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
