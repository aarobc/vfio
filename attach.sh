#!/bin/bash
if [[ $(virsh list | grep gamingvm) != "" ]]
then
vm=gamingvm
fi

virsh attach-device $vm mouse.xml
virsh attach-device $vm keyboard.xml
virsh attach-device $vm controller.xml
virsh attach-device $vm steam.xml
# virsh attach-device $vm sound.xml
# virsh attach-device $vm occulus.xml
# virsh attach-device $vm rift.xml
