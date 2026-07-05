#!/usr/bin/env bash

BAT=/sys/class/power_supply/BAT1

capacity=$(<"$BAT/capacity")
status=$(<"$BAT/status")
charge_now=$(<"$BAT/charge_now")     # µAh
charge_full=$(<"$BAT/charge_full")   # µAh
current_now=$(<"$BAT/current_now")   # µA

case "$status" in
    Charging)
        icon="󰂄"
        remaining=$((charge_full - charge_now))
        ;;
    Full)
        icon="󰁹"
        ;;
    Discharging)
        remaining=$charge_now

        if   ((capacity >= 90)); then icon="󰁹"
        elif ((capacity >= 80)); then icon="󰂂"
        elif ((capacity >= 70)); then icon="󰂁"
        elif ((capacity >= 60)); then icon="󰂀"
        elif ((capacity >= 50)); then icon="󰁿"
        elif ((capacity >= 40)); then icon="󰁾"
        elif ((capacity >= 30)); then icon="󰁽"
        elif ((capacity >= 20)); then icon="󰁼"
        elif ((capacity >= 10)); then icon="󰁻"
        else icon="󰁺"
        fi
        ;;
    *)
        icon="󰂃"
        ;;
esac

if [[ "$status" != "Full" && "$current_now" -gt 0 ]]; then
    # Time = charge / current (hours)
    total_minutes=$((remaining * 60 / current_now))
    hours=$((total_minutes / 60))
    minutes=$((total_minutes % 60))

    if ((hours > 0)); then
        time="${hours}h${minutes}m"
    else
        time="${minutes}m"
    fi

    echo "$icon ${capacity}% ($time)"
else
    echo "$icon ${capacity}%"
fi