# Notes

# Swap Esc and Caps Lock keys

**Disclaimer**: Make sure to *add* this to the xbk-options list, and not
overwrite the whole list with just this value.

```sh
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
```

Or alternatively, if you do not want to swap Escape and Caps Lock,
but simply set the Caps Lock key to be an alternative Escape key,
then use the following:

```sh
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
```

TODO: Investigate if the `swap` prefix is a thing to swap any two keys,
or if it is just a custom value, and it only exists for `swapescape`.
Maybe only in combination with caps?
