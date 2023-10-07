#!/usr/bin/env bash

EXTENSIONS_FILE="./extensions"

POSSIBLE_CODE_NAMES=(code codium code-oss)

for CODE in ${POSSIBLE_CODE_NAMES[@]}; do
    echo "Checking for '$CODE' on PATH..."
    if which "$CODE" >/dev/null 2>&1; then
        break
    fi
done

if ! which "$CODE" >/dev/null 2>&1; then
    echo "VSCode not found on PATH." >&2
    exit 1
fi

echo "'$CODE' found."
echo

while read ext; do
	[[ -z "$ext" ]] && continue
	echo "Installing '$ext'..."
	$CODE --install-extension "$ext" >/dev/null 2>&1
	exit_code=$?
	[[ $exit_code != 0 ]] && 1>&2 echo "Something went wrong installing '$ext' ($exit_code)"
done < <(sed 's/#.*//' "$EXTENSIONS_FILE"; echo)
