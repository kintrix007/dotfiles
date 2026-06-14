# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f /etc/bashrc ]] && source /etc/bashrc

# Load user aliases
[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# I am not that stingy -- if it's already set, leave it.
if [[ -z ${EDITOR+x} ]]; then
  # Set default editor
  export EDITOR=vim
fi

# Helper function to display git branch in shell prompt
__ps1_get_git_branch() {
  local line
  if git branch >/dev/null 2>&1; then
    line=$(git branch 2>/dev/null | grep '^\*')
    local branch=${line##\* }
    echo "($branch) "
  fi
}

# Helper function to get the current time
__ps1_get_timestamp() {
  printf "\e[34;2;3m[%s]\e[0m" "$(date '+%H:%M:%S')"
}

# Helper function to display success of last command
__ps1_get_cmd_success() {
  # printf "\e[1;92m✔\e[0m"
  # printf "\e[1;91m✘\e[0m"
  if [[ "$CMD_SUCCESS" == 0 ]]; then
    printf "\e[0;2;92mok\e[0m"
  else
    printf "\e[0;1;91m✘%d\e[0m" "$CMD_SUCCESS"
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
PROMPT_COMMAND+=('CMD_SUCCESS=$?')
PS1='╭──\[\e[1m\]($(__ps1_get_user_or_shell)\[\e[0m\]@\[\e[1;92m\]\h \[\e[94m\]\W\[\e[0m\]\[\e[0;1m\]) '
PS1+='$(__ps1_get_cmd_success) '
PS1+='\[\e[0;3;33m\]$(__ps1_get_git_branch)\[\e[0m\]'
PS1+='$(__ps1_get_timestamp) '
PS1+=$'\n╰─\[\e[0;1m\]$\[\e[0m\] '

# Use the same PS1 variable for nix shells as well
export NIX_SHELL_PRESERVE_PROMPT=1

# Hook direnv into the shell
if which direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

# Enable Vim mode on the prompt
# set -o vi
