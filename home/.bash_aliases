# .bash_aliases

# Some generic useful aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lA'

# XBPS aliases
alias xi='sudo xbps-install'	# Use '\xi' for 'xi' from 'xtools'
alias xq='xbps-query'		# Use '\xq' for 'xq' from 'xtools'
alias xr='sudo xbps-remove'

# VSCode OSS alias
if which code-oss >/dev/null; then
	alias code='code-oss'
elif which codium >/dev/null; then
	alias code='codium'
fi
