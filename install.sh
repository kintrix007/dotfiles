#!/bin/bash

FILEPATH=`readlink -f ${BASH_SOURCE:-$0}`
SRC=`dirname $FILEPATH`

# Probably shouldn't be a part of dotfiles
# Install pipewire
#[[ -d /etc/pipewire ]] || sudo mkdir /etc/pipewire/
#sudo cp -uv $SRC/pipewire/* /etc/pipewire/

# Install home dotfiles
for f in `ls -A $SRC/home/`; do
	ln -sfv "$SRC/home/$f" ~/
done

# Install config files
[[ -d ~/.config ]] || mkdir ~/.config/

for f in $SRC/config/*; do
	ln -sfv "$f" ~/.config/
	if [[ -f "$f/.install/install.sh" ]]; then
		echo "Running '$(basename "$f")' setup scriptlet..."
		"$f/.install/install.sh" "$f/.install/"
		echo "Done."
	fi
done

# Install local bin
[[ -d ~/.local/bin ]] || mkdir ~/.local/bin

for f in $SRC/bin/*; do
	ln -sfv "$f" ~/.local/bin/
done
