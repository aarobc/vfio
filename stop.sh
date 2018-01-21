#!/bin/bash
# xrandr --output HDMI-0 --right-of DisplayPort-0 --auto --screen 0
# xrandr --output DisplayPort-0 --left-of HDMI-0 --auto --screen 0
# xrandr --output DisplayPort-0 --left-of DVI-1 --auto --screen 0
virsh shutdown gamingvm
# cset set -d system

# cpupower -c 0-5 frequency-set -g ondemand
# pkill synergy
