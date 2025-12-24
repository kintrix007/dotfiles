# Dotfiles

## Purpose

Sync configs between machines.

I decided to make this repo public because:

- This way it is super easy to get my configs on a new machine
- Someone else might be able to learn something from it? idk

## TODO

- Look into a tool to put the symlinks in place for me

Currently, all the symlinks are put into place by my a custom script:
`install.sh`. While this is very extensible, GNU `stow` is tried and tested.
Maybe I could get the same done without maintaining a Bash script?
