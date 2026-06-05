#!/bin/bash

chosen=$(printf '󰐥  Shutdown\n󰑐  Reboot\n󰏤  Suspend\n󰌾  Lock\n󰍃  Logout' | rofi -dmenu \
    -p "Power" \
    -theme "$HOME/.config/rofi/powermenu/type-1/style-1.rasi")

case "$chosen" in
    *Shutdown) systemctl poweroff ;;
    *Reboot)   systemctl reboot ;;
    *Suspend)  systemctl suspend ;;
    *Lock)     loginctl lock-session ;;
    *Logout)   hyprctl dispatch exit ;;
esac
