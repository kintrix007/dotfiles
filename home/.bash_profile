# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Directory for user services
export SVDIR=~/service

# Define an environment variable for the default terminal
export TERMINAL=alacritty

# Add local bin directory to PATH
export PATH=$PATH:$HOME/.local/bin
