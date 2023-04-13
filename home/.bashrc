# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f /etc/bashrc ]] && . /etc/bashrc

# Load user aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Load flatpak aliases
if [[ -f ~/.flatpak_aliases ]]; then
	while read line; do
		ALIAS=`echo $line | tr -s ' ' | cut -d' ' -f1`
		PACK=`echo $line | tr -s ' ' | cut -d' ' -f2`
		if [[ -n "$ALIAS" ]] && [[ -n "$PACK" ]]; then
			alias $ALIAS="flatpak run $PACK"
		fi
	done < <(sed 's/#.*//' ~/.flatpak_aliases)
fi

# Set default editor
export EDITOR=vim

# Helper function to display git branch in shell prompt
__ps1_get_git_branch() {
    if git branch >/dev/null 2>&1; then
        local branch=`git branch 2>/dev/null | grep '^*' | cut -d' ' -f2`
        echo "($branch)"
    fi
}

# Set console prompt
PS1='\[\e[1m\][\[\e[92m\]\u\[\e[0m\]@\[\e[1;92m\]\h \[\e[94m\]\W\[\e[0m\]\[\e[0;1m\]] '
PS1+='$([[ $? == 0 ]] && echo "\[\e[1;92m\]✔\[\e[0m\]" || echo "\[\e[1;91m\]✘\[\e[0m\]") '
PS1+='\[\e[0;3;93m\]$(__ps1_get_git_branch)\[\e[0m\] '
PS1+=$'\n\[\e[0;1m\]$\[\e[0m\] '

# Hook direnv into the shell
which direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"

# Rustup
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# ghcup-env
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

. "$HOME/.cargo/env"
