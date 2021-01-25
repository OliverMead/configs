#!/usr/bin/env sh

[[ -f /etc/xprofile ]] && . /etc/xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xcape -e 'Caps_Lock=Escape'
exec dwm
