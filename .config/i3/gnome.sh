# https://wiki.ubuntu.com/Keybindings

gnome-flashback

# remove gnome-terminal header bar
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

# remove all keybinds
unset_all () {
    gsettings list-keys $1 | while read k;
    do
        if [[ "$k" == "max-screencast-length" ]]; then
            :
        elif [[ "$k" == "priority" ]]; then
            :
        elif [[ "$k" == "active" ]]; then
            gsettings set $1 $k false
        else
            gsettings set $1 $k "[]"
        fi
    done
}

unset_all org.gnome.desktop.wm.keybindings

# ibus-gnome
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Control>space']"

# disable media-keys
unset_all org.gnome.settings-daemon.plugins.media-keys
