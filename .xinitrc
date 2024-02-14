#!/usr/bin/env sh

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.Xresources ] && xrdb ~/.Xresources
[ -f ~/.xinitrc.local ] && . ~/.xinitrc.local

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

lxsession &
unclutter --timeout 1 &
xcape -e 'Caps_Lock=Escape'
# picom &
hsetroot -cover ~/wallpaper.png
tmux &
dunst &
pa-notify &
exec $WM
