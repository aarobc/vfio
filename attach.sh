#!/bin/bash
if [[ $(virsh list | grep gamingvm) != "" ]]
then
vm=gamingvm
fi

# virsh attach-device $vm mouse.xml
# virsh attach-device $vm keyboard.xml
virsh attach-device $vm sound.xml
