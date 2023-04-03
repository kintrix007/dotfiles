# .bash_aliases

# Some generic useful aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lA'

# XBPS aliases
alias xi='sudo xbps-install'	# Use '\xi' for 'xi' from 'xtools'
alias xq='xbps-query'		# Use '\xq' for 'xq' from 'xtools'
alias xr='sudo xbps-remove'

# Funi
alias :q='which cowsay >/dev/null 2>&1 && cowsay "idiot" 2>/dev/null || echo "idiot"'
alias :wq='which cowsay >/dev/null 2>&1 && cowsay "idiot" 2>/dev/null || echo "idiot"'
