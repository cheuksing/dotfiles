#!/bin/bash

lang1="xkb:us::eng"
lang2="libpinyin"

ibus_print() {
  if xset -q | grep -Eoq 'Caps Lock:[[:blank:]]+on'; then
    printf "Caps   "
  fi

  if [ "$(ibus engine)" = $lang1 ]; then
    printf "en"
  else
    printf "cn"
  fi

  printf "\n"
}

ibus_toggle() {
  if [ "$(ibus engine)" = $lang1 ]; then
    ibus engine $lang2
  else
    ibus engine $lang1
  fi
}

case "$1" in
    --toggle)
        ibus_toggle
        ;;
    *)
        ibus_print
        ;;
esac