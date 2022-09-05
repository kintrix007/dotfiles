#!/bin/bash

SRC="$1"
EXTENSIONS_FILE="$SRC/extensions"

while read ext; do
	[[ -n "$ext" ]] || continue
	echo "Installing '$ext'..."
	code --install-extension "$ext" > /dev/null 2>&1
	exit_code=$?
	[[ $exit_code != 0 ]] && 1>&2 echo "Something went wrong installing '$ext' ($exit_code)"
done < <(sed 's/#.*//' "$EXTENSIONS_FILE"; echo)
