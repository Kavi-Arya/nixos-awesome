#!/bin/sh

FILE="/etc/X11/xorg.conf/20-nvidia.conf"

### MY ADDS ###
function pc () {
  xset r rate 350 75 &
  setxkbmap -option caps:super &
  pgrep -x picom > /dev/null || picom -b &
  xrandr --output HDMI-0 --mode 1920x1080 --rate 144 &
  xrandr --output eDP-1-1 --off  &
  nvidia-settings --load-config-only &
  brightnessctl -d "intel_backlight" set 0% &
  xinput disable "SYNA7DB5:01 06CB:CD41 Touchpad" &
  xinput disable "AT Translated Set 2 keyboard" &
  xinput disable "HD User Facing: HD User Facing" &
  xsetroot -cursor_name cross & 
  echo "PC"
}
function laptop () {
  xset r rate 350 75 &
  setxkbmap -option caps:super &
  pgrep -x picom > /dev/null || picom -b &
  kitty -e sudo intel-undervolt apply &
  xsetroot -cursor_name cross & 
  echo "LAPTOP"
}

if test -f "/etc/X11/xorg.conf.d/20-nvidia.conf"; then
   pc 
 else
  laptop
fi
