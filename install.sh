#!/bin/bash

FILEPATH=`readlink -f ${BASH_SOURCE:-$0}`
SRC=`dirname $FILEPATH`

# Probably shouldn't be a part of it
# Install pipewire
#[[ -d /etc/pipewire ]] || sudo mkdir /etc/pipewire/
#sudo cp -uv $SRC/pipewire/* /etc/pipewire/

# Install config files
[[ -d ~/.config ]] || mkdir ~/.config/

for f in $SRC/config/*; do
	fb=`basename $f`
	ln -sfv $f ~/.config/
done

# Install local bin
[[ -d ~/.local/bin ]] || mkdir ~/.local/bin

for f in $SRC/bin/*; do
	ln -sfv $f ~/.local/bin/
done
