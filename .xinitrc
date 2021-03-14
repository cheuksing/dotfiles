#!/bin/sh
#
# ~/.xinitrc

###########################################################
# Config
########################################################### 

SCREEN0=DP-0.8
SCREEN1=HDMI-0

WORKING=1
GAMING=2
LUTRIS=3

###########################################################
# Thunar
########################################################### 

safely_start_thunar () {
  # wait until gvfs done, see arch wiki
  until pgrep gvfs >/dev/null; do
    sleep 1
  done
  thunar --daemon &
}

###########################################################
# Compton
########################################################### 

compositor () {
  if [ -f /usr/bin/picom ]; then
    # -b run as daemon
    picom -b
  elif [ -f /usr/bin/compton ]; then
    compton &
  fi
}

###########################################################
# mouse settings
###########################################################

# https://stackoverflow.com/a/18756948
# xinput --list --id-only somehow not working in startx

# MOUSENAME="ELECOM ELECOM TrackBall Mouse"

# ids=$(xinput --list | awk -v search="$MOUSENAME" \
#     '$0 ~ search {match($0, /id=[0-9]+/);\
#                   if (RSTART) \
#                     print substr($0, RSTART+3, RLENGTH-3)\
#                  }'\
#      )

# for i in $ids
# do
#   # accel off
#   # xinput set-prop $i "libinput Accel Profile Enabled" 0, 1
#   # xinput set-prop $i "libinput Accel Speed" 0

#   # i need mouse accel for trackball
#   xinput set-prop $i "libinput Accel Profile Enabled" 1, 0
#   xinput set-prop $i "libinput Accel Speed" -0.3xp
# done

# openrazer daemon refuse to connect, kill it and wait for restart when needed
killall -q openrazer-daemon

setxkbmap -option terminate:ctrl_alt_bksp

case $(fgconsole) in
  1)
    # test for an existing bus daemon, just to be safe
    if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
      # if not found, launch a new one
      eval `dbus-launch --sh-syntax --exit-with-session`
    fi

    export GDK_SCALE=2
    export GDK_DPI_SCALE=0.5
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_QPA_PLATFORMTHEME=qt5ct

    # it seems setting GTK_IM_MODULE
    # will auto start nimf when any GTK app launch
    export GTK_IM_MODULE=nimf
    export QT4_IM_MODULE="nimf"
    export QT_IM_MODULE=nimf
    export XMODIFIERS="@im=nimf"
    # nimf

    # Set up screens
    if [ `xrandr | grep -c ' connected '` -eq 2 ]; then # dual-monitor
      if [ `xrandr | grep $SCREEN1 | grep -c ' connected '` -eq 1 ]; then
        xrandr \
          --output "$SCREEN0" --primary --mode "2560x1440" --pos "0x0" --scale "1.25x1.25"  \
          --output "$SCREEN1" --mode "2560x1440" --pos "0x-1800" --scale "1.25x1.25"
      fi
    fi

    if [ -f ~/.Xresources ]; then
        xrdb -load ~/.Xresources
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

    compositor &

    # run in background
    if [ -f /usr/bin/ulauncher ]; then
      ulauncher --no-window-shadow --hide-window &
    fi

    if [ -f /usr/bin/thunar ]; then
      safely_start_thunar &
    fi

    if [ -f /usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd ]; then
      /usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd &
    fi

    # start an wm
    exec i3
  ;;
  2)
    # game keybinds
    setxkbmap us

    export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

    xrandr \
      --output "$SCREEN0" --mode "2560x1440" --refresh "59.5"  \
    --output "$SCREEN1" --off

    xset -dpms
    xset s off

    steam -tenfoot &
    # steam -tenfoot -steamos -enableremotecontrol &
    exec i3 -c ~/.config/i3/gaming
  ;;
  3)
    # game keybinds
    setxkbmap us

    export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

    xrandr \
      --output "$SCREEN0" --mode "2560x1440" --refresh "59.5"  \
    --output "$SCREEN1" --off

    xset -dpms
    xset s off

    lutris &
    exec i3 -c ~/.config/i3/gaming
  ;;
esac
