#!/usr/bin/env sh

[[ -f /etc/xprofile ]] && . /etc/xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

lxsession &
unclutter --timeout 1 &
xcape -e 'Caps_Lock=Escape'
picom &
hsetroot -cover ~/wallpaper.webp
exec dwm
