#!/bin/sh
#
# ~/.xinitrc

# Set up screens
if [ `xrandr | grep -c ' connected '` -eq 2 ]; then # dual-monitor
    if [ `xrandr | grep HDMI-A-0 | grep -c ' connected '` -eq 1 ]; then
        xrandr \
          --output "DisplayPort-1" --primary --mode "2560x1440" --pos "0x1800" --scale "1.25x1.25"  \
          --output "HDMI-A-0" --mode "2560x1440" --pos "0x0" --scale "1.25x1.25"
    fi
fi

if [ -f ~/.Xresources ]; then
    xrdb -load ~/.Xresources
fi

if [ -f /usr/bin/ibus-daemon ]; then
    env GDK_SCALE=1 GDK_DPI_SCALE=1 ibus-daemon -drx
fi

if [ -f /usr/bin/nitrogen ]; then
  nitrogen --restore
fi

# turn off the cpu default bell
if [ -f /usr/bin/xset ]; then
    xset -b
    xset s 1800 1800
    xset -dpms
fi

if [ -f /usr/bin/picom ]; then
  # -b run as daemon
  picom -b
fi

# run in background
if [ -f /usr/bin/ulauncher ]; then
   ulauncher --no-window-shadow --hide-window &
fi

if [ -f /usr/bin/thunar ]; then
   thunar --daemon &
fi

# eval $(dbus-launch --sh-syntax)

if [ -f /usr/bin/i3 ]; then
    exec dbus-launch --exit-with-session --sh-syntax i3
fi
