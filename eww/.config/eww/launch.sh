#!/usr/bin/env bash

eww kill 2>/dev/null
eww daemon

monitor_count=$(grep -l "^connected" /sys/class/drm/card*-*/status 2>/dev/null | wc -l)

for i in $(seq 0 $((monitor_count - 1))); do
    eww open clock --id "clock-$i" --screen "$i"
done
