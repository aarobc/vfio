#!/bin/bash
xrandr --output HDMI-1 --right-of DVI-I-1 --auto --screen 0
virsh shutdown gamingvm1
