#!/usr/bin/env bash

BG=141414
ACCENT=00ff41
BORDER=3F3F3F
TEXT=00ff41
ALERT=ff0000

swaylock \
  --color ${BG} \
  --inside-color ${BG} \
  --inside-ver-color ${BG} \
  --inside-wrong-color ${BG} \
  --ring-color ${ACCENT} \
  --ring-ver-color ${ACCENT} \
  --ring-wrong-color ${ALERT} \
  --line-color 00000000 \
  --separator-color ${BORDER} \
  --text-color ${TEXT} \
  --key-hl-color ${ACCENT} \
  --bs-hl-color ${ALERT} \
  --indicator-radius 90 \
  --indicator-thickness 8 \
  --indicator-caps-lock \
  --show-failed-attempts \
  --font "JetBrainsMono Nerd Font"