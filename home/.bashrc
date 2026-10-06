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

if [[ -z ${LESS+x} ]]; then
  # Handle raw control chars
  export LESS="-R"
fi

# Make sure which reads more than just the PATH
function which() {
  (alias; declare -f) |
    command which --tty-only --read-alias --read-functions \
      --show-tilde --show-dot "$@"
}
export -f which

# Create directory and cd into it
function c() {
  # shellcheck disable=SC2199,SC2164
  if ! [[ -d "${@: -1}" ]]; then
    mkdir "$@" && cd "$_"
  fi
}
export -f c

# Helper function to display git branch in shell prompt
__ps1_get_git_branch() {
  local line
  # FIXME: Do it with a single 'git' invocation
  if git branch >/dev/null 2>&1; then
    line=$(git branch 2>/dev/null | grep '^\*')
    local branch=${line##\* }
    printf "\e[0;3;33m(%s) " "$branch"
  fi
}

# Helper function to get the current jj change and commit IDs
__ps1_get_jj_current_change() {
  local cur
  cur="$(jj log -r '@' --color always --no-graph --no-pager)"
  # shellcheck disable=SC2181
  [[ "$?" != 0 ]] && return

  <<<"$cur" head -1 | cut -d' ' -f1,5 |
    xargs printf "\e[0;33;1;2;3mjj\e[0;3m(%s %s\e[0;3m) "
}

# Figure out if PWD is in a jujutsu repository.
# We do this because `jj status >/dev/null` very slow, about 100ms even
# when just reporting "not a jj repo".
__ps1_is_jj_repo() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -d "$dir"/.jj ]]; then
      return 0
    fi
    dir="$(dirname "$dir")"
  done

  return 1
}

# Show jj change info, if in a jj repo; otherwise show git branch
__ps1_get_vcs_info() {
  if __ps1_is_jj_repo; then
    __ps1_get_jj_current_change
  else
    __ps1_get_git_branch
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
PS1+='$(__ps1_get_vcs_info)\[\e[0m\]'
PS1+='$(__ps1_get_timestamp) '
PS1+=$'\n''╰─\[\e[0;1m\]$\[\e[0m\] '

# Use the same PS1 variable for nix shells as well
export NIX_SHELL_PRESERVE_PROMPT=1

# NOTE: This is already handled by the NixOS config. Do not enable!
# if which direnv >/dev/null 2>&1; then
#   eval "$(direnv hook bash)"
# fi

# Enable Vim mode on the prompt
# set -o vi
