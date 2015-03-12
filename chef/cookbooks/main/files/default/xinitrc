#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

source $HOME/.xsessionrc

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# console kit eh?
# exec ck-launch-session

DEFAULT_SESSION=awesome
case $1 in
  kde) exec startkde ;;
  xfce4) exec startxfce4 ;;
  awesome|xmonad|wmaker|blackbox) exec ssh-agent -t 32400 -a /tmp/blackman.agent.sock $1 ;;
  *) exec ssh-agent -t 32400 -a /tmp/blackman.agent.sock $DEFAULT_SESSION ;;
esac
