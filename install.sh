#!/bin/bash

FILEPATH=`readlink -f ${BASH_SOURCE:-$0}`
SRC=`dirname $FILEPATH`

config-specific-install() {
	for f in $SRC/config/*; do
		if [[ -f "$f/.install/install.sh" ]]; then
			echo "Running '$(basename "$f")' setup scriptlet..."
			pushd "$f/.install" &&\
			./install.sh
			popd
			echo "Done."
		fi
	done

}

if [[ "$1" == "--config" || "$1" == "-c"  ]]; then
	config-specific-install
	exit
fi

# Install home dotfiles
for f in `ls -A $SRC/home/`; do
	ln -siv "$SRC/home/$f" ~/
done

# Install config files
[[ -d ~/.config ]] || mkdir ~/.config/

for f in $SRC/config/*; do
	ln -siv "$f" ~/.config/
done

# Install local bin
[[ -d ~/.local/bin ]] || mkdir ~/.local/bin

for f in $SRC/bin/*; do
	ln -siv "$f" ~/.local/bin/
done

# Run local installation after all are symlinked
config-specific-install
