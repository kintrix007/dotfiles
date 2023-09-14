# scripts/README.md

AKA: Some other notes that did not warrant writing a script.

### `libgourou` - If you just want to open the acsm files

- Is available in the AUR and Nixpkgs.

Usage instructions at the end of the homepage: \
https://indefero.soutade.fr/p/libgourou/

1.  `adept_activate -u <AdobeID USERNAME> # once to login` \
    or \
    `adept_activate --anonymous # to use an anonymous account with no need to login`

2. Download contents with: `acsmdownloader -f <ACSM_FILE>`

3. Remove encryption with: `adept_remove filename.epub`

