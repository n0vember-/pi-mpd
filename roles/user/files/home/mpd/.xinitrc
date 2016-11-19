#!/bin/sh

PATH=$PATH:$HOME/bin

# include systemwide xinit configuration
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# launch i3
exec i3
