#!/bin/bash
if rfkill list wifi | grep -q "Soft blocked: yes"; then
    rfkill unblock all
    notify-send "Airplane Mode" "OFF — Wireless enabled" 2>/dev/null || true
else
    rfkill block all
    notify-send "Airplane Mode" "ON — Wireless disabled" 2>/dev/null || true
fi
