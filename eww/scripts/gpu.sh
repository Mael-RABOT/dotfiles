#!/usr/bin/env bash

usage=$(cat /sys/class/drm/card0/device/gpu_busy_percent 2>/dev/null)

echo "GPU ${usage:-0}%"