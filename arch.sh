#!/bin/bash -xe

#systemctl enable libvirtd.service
# ./setupNet.sh

virsh define win.xml
# cset set -c 6-11 -s system
# cset proc -m -f root -t system
# cset proc -k -f root -t system
# cpupower -c 0-5 frequency-set -g performance

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  su
  exit 0
fi

# export QEMU_AUDIO_DRV=alsa

echo 1 > /sys/module/kvm/parameters/ignore_msrs
virsh start gamingvm

if [[ $(virsh list | grep gamingvm) == "" ]]
then
  exit 0
fi


# sleep 2
# ./attach.sh
# exit 0
