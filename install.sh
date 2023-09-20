#!/usr/bin/env bash

FILEPATH=`readlink -f ${BASH_SOURCE:-$0}`
SRC=`dirname $FILEPATH`

config-specific-install() {
    echo "Running config scripts..."
    echo
    echo

	for f in $SRC/config/*; do
		if [[ -f "$f/.install/install.sh" ]]; then
            BASE=`basename "$f"`
			echo "Running '$BASE' setup scriptlet..."

			pushd "$f/.install" >/dev/null &&\
			./install.sh &&\
			popd >/dev/null &&\

			echo "$BASE: Done."
		fi
	done

    echo
    echo
    echo "Finished running config scripts."
}

if [[ "$1" == "--script" || "$1" == "-s"  ]]; then
    echo "Running only setup scripts..."
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

if [[ "$1" == "--link-only" || "$1" == "-l"  ]]; then
    echo "Skiped running setup scripts, only copied config files."
	exit
fi

# Run local installation after all are symlinked
config-specific-install
