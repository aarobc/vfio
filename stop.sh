#!/bin/bash
# xrandr --output HDMI-1 --right-of DVI-I-1 --auto --screen 0
virsh shutdown gamingvm

# cset set -d system

sudo cpupower -c 0-5 frequency-set -g ondemand
