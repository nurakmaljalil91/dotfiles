#!/usr/bin/env bash

pkill conky 2>/dev/null
sleep 0.5

CONFIG=~/.config/conky/clock.conkyrc
GAP=20
VIRT_W=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -dx -f1)

while IFS= read -r line; do
    geom=$(echo "$line" | grep -oE '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+')
    [ -z "$geom" ] && continue

    W=$(echo "$geom" | cut -dx -f1)
    MX=$(echo "$geom" | cut -d+ -f2)
    MY=$(echo "$geom" | cut -d+ -f3)

    # gap_x/gap_y for alignment=top_right on the virtual screen
    gx=$((VIRT_W - MX - W + GAP))
    gy=$((MY + GAP))

    tmp=$(mktemp /tmp/conky_XXXX.conkyrc)
    sed -e "s/alignment = '[^']*'/alignment = 'top_right'/" \
        -e "s/gap_x = [0-9]*/gap_x = $gx/" \
        -e "s/gap_y = [0-9]*/gap_y = $gy/" \
        -e "s/xinerama_head = [0-9]*/xinerama_head = 0/" \
        "$CONFIG" > "$tmp"
    conky -c "$tmp" &
done < <(xrandr | grep ' connected')
