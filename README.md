## dotfiles

### Intro
This is my configured minimal i3 settings. You can take it if you want, but you may want to remove some env vars in .zshrc and .profile.

These files include changes:

- mostly for theming (mainly use gtk)
  - gtk
  - qt
  - gitk
  - polybar (status bar) and its modules

- also some env variables for
  - nvm
  - yarn
  - ibus

### Previews
  ![screenshot](https://github.com/cheuksing/dotfiles/blob/master/screenshot/low-res.jpg)

### How to use
  - copy all files in this repo to $HOME

## Important Note
  - This is a 4k display config
  - Please set Xft.dpi based on your monitor
  - If you use lightdm, you can use lightdm-gtk-greeter-settings to
    - set Xft.dpi
    - set background
    - some other gtk fields
  - You can also set it within .xsettingsd

### Requirements
  - polybar
  - ulauncher
  - qt5-style-plugins (For qGtkStyle)
  - xsettingsd (a lightweight x setting daemon)

### Other recommended apps
  - lightdm
  - lightdm-gtk-greeter-settings
  - flameshot
  - zsh
  - nvm (for web-dev)
  - yarn (for web-dev)

### Polybar default modules
  - i3
  - date
  - pulseaudio

### Polybar custom modules
  - ibus
    - similar to xkeyboard
    - detect Caps and ibus engine
    - on click toggle
    - PLEASE CHANGE TO YOUR INPUT METHOD IF NEEDED

  - bluetooth
    - based on polybar-scripts
    - showing states
      - service !== running
      - on (none)
      - on (list connected devices)
      - off