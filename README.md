# Dotfiles a la kintrix007

## Purpose

Like most people, I do not want to redo the configuration of all the software I
use, so instead I decided to make my dotfiles public. This way it is super easy
to set up a new computer the way I like it, because I can just clone my dotfiles
repo and that includes every config I want.

## Plans

Currently, all the symlinks are put into place by my (very crude) custom script,
`install.sh`. While this does work and allows quite a bit of personalization
with regards to the installation process, I wanna explore GNU `stow` as an
alternative. Coincidentally, my install script already does something very
similar to GNU `stow`, so maybe it would be possible to get rid of all the
custom scripting and use it as a pre-existing solution.
