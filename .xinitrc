#!/usr/bin/env sh

[[ -f /etc/xprofile ]] && . /etc/xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ $VNC ]
then
  exec vncviewer
else 
  unclutter --timeout 1 &
  xcape -e 'Caps_Lock=Escape'
  exec dwm
fi
