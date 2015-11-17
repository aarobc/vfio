#!/bin/bash
if [[ $(virsh list | grep gamingvm1) != "" ]]
then
vm=gamingvm1
fi

virsh attach-device $vm mouse.xml
virsh attach-device $vm keyboard.xml
virsh attach-device $vm sound.xml
