#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xmodmap ~/.i3/xmodmap

if which urxvtd > /dev/null 2>&1; then
	mkdir -p "$HOME/.urxvt" && rm -f "$HOME/.urxvt/"urxvtd-*
	export RXVT_SOCKET="$HOME/.urxvt/urxvtd-$(hostname)-$$"
	urxvtd -f -o -q
fi

#if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
#fi

exec i3 --shmlog-size=26214400 > /dev/null
