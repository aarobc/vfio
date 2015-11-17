#!/bin/bash
set -x
xrandr --output HDMI-1 --off --screen 0
virsh define win.xml
modprobe vfio-pci
modprobe kvm ignore_msrs=1
DEVLIST="0000:07:00.0 0000:07:00.1"
# DEVLIST="0000:01:00.0 0000:01:00.1"

for dev in $DEVLIST;do
vendor=$(cat /sys/bus/pci/devices/$dev/vendor)
device=$(cat /sys/bus/pci/devices/$dev/device)
if [ -e /sys/bus/pci/devices/$dev/driver ]
then
echo $dev > /sys/bus/pci/devices/$dev/driver/unbind
fi

echo $vendor $device > /sys/bus/pci/drivers/vfio-pci/new_id

done

# virsh start gamingvm
virsh start gamingvm1
set +x
