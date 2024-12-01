# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f /etc/bashrc ]] && . /etc/bashrc

# Load user aliases
[[ -f "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"

# Load flatpak aliases
if [[ -f ~/.flatpak_aliases ]]; then
	while read -r line; do
		ALIAS="$(echo "$line" | tr -s ' ' | cut -d' ' -f1)"
		PACK="$(echo "$line" | tr -s ' ' | cut -d' ' -f2)"
		if [[ -n "$ALIAS" ]] && [[ -n "$PACK" ]]; then
			alias "$ALIAS"="flatpak run $PACK"
		fi
	done < <(sed 's/#.*//' ~/.flatpak_aliases)
fi

# set -o vi

# Set default editor
export EDITOR=vim

# Use the same PS1 variable for nix shells as well
export NIX_SHELL_PRESERVE_PROMPT=1

# Helper function to display git branch in shell prompt
__ps1_get_git_branch() {
    if git branch >/dev/null 2>&1; then
        local line
        line=$(git branch 2>/dev/null | grep '^\*')
        local branch=${line##\* }
        echo "($branch)"
    fi
}

# Helper function to display success of last command
__ps1_get_cmd_success() {
    if [[ "$CMD_SUCCESS" == 0 ]]; then
        printf "\e[1;92m✔\e[0m"
    else
        printf "\e[1;91m✘\e[0m"
    fi
}

# Display useful information about the current shell instead of the username
# when relevant. For example, display 'nix-shell' instead, while in a Nix
# shell.
__ps1_get_user_or_shell() {
    if [[ -z $IN_NIX_SHELL ]]; then
        if [[ -z $GUIX_ENVIRONMENT ]]; then
            printf "\e[92m%s" "$USER"
        else
            printf "\e[30mguix-shell"
        fi
    else
        if [[ "$SHELL" =~ /nix* ]]; then
            printf "\e[93mnix-shell"
        else
            printf "\e[95mdirenv"
        fi
    fi
}

# Set console prompt
PROMPT_COMMAND=('CMD_SUCCESS=$?')
PS1='╭──\[\e[1m\]($(__ps1_get_user_or_shell)\[\e[0m\]@\[\e[1;92m\]\h \[\e[94m\]\W\[\e[0m\]\[\e[0;1m\]) '
PS1+='$(__ps1_get_cmd_success) '
PS1+='\[\e[0;3;33m\]$(__ps1_get_git_branch)\[\e[0m\] '
PS1+=$'\n╰─\[\e[0;1m\]$\[\e[0m\] '

# Hook direnv into the shell
if which direnv >/dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi

# Rustup
[[  -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# ghcup-env
[[  -f "$HOME/.ghcup/env" ]] && source "$HOME/.ghcup/env"

# .bashrc should exit with 0 when sourced if there were no errors
true
