#!/bin/bash
if [[ $(virsh list | grep gamingvm) != "" ]]
then
vm=gamingvm
fi

virsh attach-device $vm sound.xml
