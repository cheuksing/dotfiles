#!/bin/bash

active_lang="cn"
inactive_lang="en"

kb_print() {
  while true; do
    if xset -q | grep -Eoq 'Caps Lock:[[:blank:]]+on'; then
      printf "Caps   %s"
    fi

    if [ "$(fcitx-remote)" = 2 ]; then
      printf "$active_lang"
    else
      printf "$inactive_lang"
    fi

    printf "\n"
  done
}

kb_toggle() {
  fcitx-remote -t
}

case "$1" in
    --toggle)
        kb_toggle
        ;;
    *)
        kb_print
        ;;
esac