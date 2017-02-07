#!/bin/bash
set -x
# xrandr --output HDMI-0 --off --screen 0
# xrandr --output DisplayPort-0 --off --screen 0


cset set -c 6-11 -s system
cset proc -m -f root -t system
cset proc -k -f root -t system

sudo -u ac synergy & 2>&1 /dev/null

cpupower -c 0-5 frequency-set -g performance

virsh define win.xml
modprobe vfio-pci
modprobe kvm ignore_msrs=1
# modprobe kvm halt_poll_ns=400000
DEVLIST="0000:05:00.0 0000:05:00.1"

for dev in $DEVLIST;do
vendor=$(cat /sys/bus/pci/devices/$dev/vendor)
device=$(cat /sys/bus/pci/devices/$dev/device)
if [ -e /sys/bus/pci/devices/$dev/driver ]
then
echo $dev > /sys/bus/pci/devices/$dev/driver/unbind
fi

echo $vendor $device > /sys/bus/pci/drivers/vfio-pci/new_id

done

virsh start gamingvm
set +x
