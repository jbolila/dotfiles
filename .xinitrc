#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# xset +fp /home/jbolila/.fonts/Input_Fonts/InputMono/InputMono

/usr/bin/VBoxClient-all

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Clipboard / Primary
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# hide mouse coursor when isn't used
unclutter -root -visible &

# auto locking
xautolock -time 7 -lock ~/local/bin/fuzzy_lock.sh &

setxkbmap -option compose:menu

if which urxvtd > /dev/null 2>&1; then
  mkdir -p "$HOME/.urxvt" && rm -f "$HOME/.urxvt/"urxvtd-*
  export RXVT_SOCKET="$HOME/.urxvt/urxvtd-$(hostname)-$$"
  urxvtd -f -o -q
fi

#if [ -s ~/.Xmodmap ]; then
#  xmodmap ~/.Xmodmap
#fi

exec ssh-agent i3 --shmlog-size=26214400 > /dev/null
