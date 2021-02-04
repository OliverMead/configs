#!/usr/bin/env sh

[[ -f /etc/xprofile ]] && . /etc/xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

unclutter --timeout 1 &
xcape -e 'Caps_Lock=Escape'
exec dwm
