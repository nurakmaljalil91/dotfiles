#!/bin/bash

# Trigger a fresh scan (non-blocking)
nmcli device wifi rescan 2>/dev/null &
sleep 1

# Pick menu tool (prefer wofi on Wayland)
if command -v wofi &>/dev/null; then
    MENU="wofi --show dmenu --prompt WiFi: --width 520 --lines 12 --insensitive"
elif command -v rofi &>/dev/null; then
    MENU="rofi -dmenu -p ' WiFi' -i -width 520"
else
    kitty --class floating --title "Network Manager" -e nmtui
    exit 0
fi

# Build SSID list, deduplicated, sorted by signal strength
NETWORK_LIST=$(nmcli -f SSID,SIGNAL,SECURITY dev wifi list 2>/dev/null \
    | tail -n +2 \
    | awk '
        $1 != "--" {
            ssid=$1
            signal=$2
            sec=($3=="--")?"":"🔒"
            if (!seen[ssid]++) {
                printf "%3d  %-35s %s\n", signal, ssid, sec
            }
        }
    ' \
    | sort -rn \
    | awk '{$1=""; print substr($0,2)}')

# Add a fallback option
NETWORK_LIST="${NETWORK_LIST}
 Open nmtui (full manager)"

SELECTED=$(echo "$NETWORK_LIST" | $MENU)
[ -z "$SELECTED" ] && exit 0

if [[ "$SELECTED" == *"Open nmtui"* ]]; then
    kitty --class floating --title "Network Manager" -e nmtui
    exit 0
fi

# Extract SSID (trim leading/trailing spaces, strip lock icon)
SSID=$(echo "$SELECTED" | sed 's/[[:space:]]*🔒[[:space:]]*//' | xargs)

# Try connecting — works instantly for saved networks
if nmcli dev wifi connect "$SSID" 2>/dev/null; then
    notify-send "WiFi" "Connected to $SSID" 2>/dev/null || true
else
    # Ask for password via rofi, or fall back to nmtui
    if command -v rofi &>/dev/null; then
        PASSWORD=$(echo "" | rofi -dmenu -p "Password for '$SSID':" -password)
        if [ -n "$PASSWORD" ]; then
            if nmcli dev wifi connect "$SSID" password "$PASSWORD" 2>/dev/null; then
                notify-send "WiFi" "Connected to $SSID" 2>/dev/null || true
            else
                notify-send "WiFi Error" "Failed to connect to $SSID" 2>/dev/null || true
                kitty --class floating --title "Network Manager" -e nmtui
            fi
        fi
    else
        kitty --class floating --title "Network Manager" -e nmtui
    fi
fi
