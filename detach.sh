#!/bin/bash
if [[ $(virsh list | grep gamingvm1) != "" ]]
then
vm=gamingvm1
fi

virsh detach-device $vm mouse.xml
# virsh detach-device $vm keyboard.xml
