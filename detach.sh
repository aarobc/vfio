#!/bin/bash
if [[ $(virsh list | grep gamingvm) != "" ]]
then
vm=gamingvm
fi

virsh detach-device $vm mouse.xml
virsh detach-device $vm sound.xml
# virsh detach-device $vm keyboard.xml
virsh detach-device $vm occulus.xml
virsh detach-device $vm rift.xml
