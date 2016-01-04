#!/bin/bash
if [[ $(virsh list | grep gamingvm) != "" ]]
then
vm=gamingvm
fi

virsh detach-device $vm mouse.xml
# virsh detach-device $vm keyboard.xml
