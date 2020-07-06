## dotfiles

### Intro

This is mainly i3 settings, extends from Manjaro i3, as well as some web-dev config.

GTK / Qt Themes are already using similar dark theme, by default in Manjaro i3.
Colors remains unchanged.

##### This includes

  - HIDPI settings
  - Picom / Compton
  - Polybar
    - minimal fcitx applet
    - minimal bluetooth applet
  - terminal
    - zsh and Oh-my-zsh
    - fonts (comfort coding, font-awesome)
    - (color remains unchanged)
  - Ulauncher
  - Vs code styles
  - Git
      - lastpass as git password (lastpass-cli)
      - gitk styles
  - nodeJS
      - nvm, node version manager
      - added yarn global packages in $PATH
  - removed beep sound


### Previews

  ![screenshot](https://github.com/cheuksing/dotfiles/blob/master/screenshot/low-res.png)

### Install selected applications

- Oh-my-zsh, go to its github page and run its installation scripts
- Ulauncher, run
  - git clone https://aur.archlinux.org/ulauncher.git && cd ulauncher && makepkg -is
- These are usefull apps can be installed from pacman, run
  - pacman -S lastpass-cli polybar chromium code flameshot deluge deluge-gtk gitk tk
- If you use fcitx, (this use fcitx-rime)
  - pacman -S fcitx fcitx-configtool fcitx-rime
- Some optional AUR packages
  - Typora

### How to use
  - copy config files in this repo to relative directories, usually $HOME
  - Fix pcmanfm
    - echo "X11Forwarding yes" >> /etc/ssh/sshd_config
    - ref: https://superuser.com/a/310201
  - set lasspass-cli-git
    - chmod 777 $HOME/.config/git/lpass.sh
    - git config credential.helper "$HOME/.config/git/lpass.sh"
  - Also
    - Set yout wallpaper with nitrogen
    - Change your GTK qt theme
    - Change your colors in Xresources
    - Change your oh-my-zsh theme

### Notes

- Hidpi 
  - See .profile and ./Xresources (dpi and xcursor)
- Hidpi Pcmanfm
  - See gtkrc-2.0 and ./.config/pcmanfm
- VsCode config file
  - was "Code/User" and now "Code - OSS/User"
- Compton was renamed to Picom
  - Manjaro i3 not yet handled
  - remove compton.conf and use picom.conf
- if systemd-analyze blame found random-seed slow
  - add **random.trust_cpu=on** within grub command, if cpu support RDRAND

### Why Manjaro i3

- It already setup compositor
- It handles most gtk / qt related stuff and comes with an uniform look
- No need to handle minor issue such as chrome-keyring, etc.