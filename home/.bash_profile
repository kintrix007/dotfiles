# .bash_profile

# Set Bash history size
export HISTSIZE=10000
export HISTFILESIZE=10000

# Get the aliases and functions
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

[ -f "$HOME/.XCompose" ] && export XCOMPOSEFILE="$HOME/.XCompose"
[ -d "$HOME/Android/Sdk" ] && export ANDROID_HOME="$HOME/Android/Sdk"

GUIX_PROFILE="/home/kin/.guix-profile"
if [[ -f "$GUIX_PROFILE/etc/profile" ]]; then
  export GUIX_PROFILE
  source "$GUIX_PROFILE/etc/profile"
fi

# Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# For the fake VB interpreter thing
export VB_INTERPRETER_PROJECT_PATH="$HOME/code/vb-interpreter/src"
