## dotfiles

### Intro

### useful ppa
```
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo add-apt-repository ppa:agornostal/ulauncher
sudo add-apt-repository ppa:papirus/papirus
```

### Install selected applications
 - ulauncher
 - flameshot 
 - gitk tk
 - i3-gaps nitrogen lxappearance qt5ct qt5-style-kvantum qt5-style-kvantum-themes
 - lpass-cli
   - see github page to build
   - cp local-bin/git-credential-lasspass ~/.local/bin
     - add it to PATH
 - nimf
   - libnimf1 nimf nimf-anthy nimf-dev nimf-libhangul nimf-m17n nimf-rime
   - use nimf instead of ibus for better HIDPI support
   - https://github.com/hamonikr/nimf
 - xfce apps
   - libexo-1-0
   - thunar
   - xfce4-notifyd (replace dunst)
 - transmission
   - bittorrent client
 - gnome-keyring seahorse
 - audio bluetooth
  - a2dp
    - apt install pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware
    - https://wiki.debian.org/BluetoothUser/a2dp
  - apt install bluetooth blueman
  - aptX (HD) and LDAC
    - https://github.com/lagerimsi-ds/debian-buster_bluetooth_aptX-LDAC/
  - fix bluetooth audio dbus error
    - https://unix.stackexchange.com/a/373583/446667

# Code Snipset

set ibus icon color
```
gsettings set org.freedesktop.ibus.panel xkb-icon-rgba "#FFFFFF"
```

set tty font size
https://askubuntu.com/a/1185941

change tty layout
```
sudo dpkg-reconfigure keyboard-configuration
```