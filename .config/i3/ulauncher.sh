#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q ulauncher

# Wait until the processes have been shut down
while pgrep -u $UID -x ulauncher >/dev/null; do sleep 1; done

# Launch bar1 and bar2
env GDK_SCALE=2 GDK_DPI_SCALE=0.5 ulauncher --no-window-shadow &
