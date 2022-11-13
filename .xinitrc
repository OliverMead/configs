#!/usr/bin/env sh

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.Xresources ] && xrdb ~/.Xresources
[ -f ~/.xinitrc.local ] && . ~/.xinitrc.local

lxsession &
unclutter --timeout 1 &
xcape -e 'Caps_Lock=Escape'
# picom &
hsetroot -cover ~/wallpaper.webp
exec dwm
