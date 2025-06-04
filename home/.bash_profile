# .bash_profile

# Get the aliases and functions
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

[ -f "$HOME/.XCompose" ] && export XCOMPOSEFILE="$HOME/.XCompose"
[ -d "$HOME/Android/Sdk" ] && export ANDROID_HOME="$HOME/Android/Sdk"

export HISTSIZE=10000
export HISTFILESIZE=10000
