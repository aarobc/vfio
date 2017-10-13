#!/bin/bash -xe

# let host and guests talk to each other over macvlan
# configures a macvlan interface on the hypervisor
# run this on the hypervisor (e.g. in /etc/rc.local)
# made for IPv4; need modification for IPv6
# meant for a simple network setup with only eth0,
# and a static (manual) ip config
# Evert Mouw, 2013

HWLINK=enp7s0
MACVLN=macvlan1
TESTHOST=www.google.com

if [ -z "$1" ]
  then
    echo "No argument supplied"
  else
    ip link delete $MACVLN type bridge

    ip link set $HWLINK down
    sleep 2
    ip link set $HWLINK up
    # sleep 2
    # systemctl restart NetworkManager.service
    exit

fi
# possible fixes:
# ip link delete macvlan0 type bridge
# ip link set enp7s0 down
# ip link set enp7s0 up
# systemctl restart NetworkManager.service

systemctl enable libvirtd.service
# net=`ifconfig | grep $MACVLN`
# if [[ $net != "" ]]
# then
#   echo "$HWLINK does exist, exiting"
#   exit
# fi
#
# echo "$MACVLN doesn't exist. Creating"


# ------------
# wait for network availability
# ------------

# while ! ping -q -c 1 $TESTHOST > /dev/null
# do
#     echo "$0: Cannot ping $TESTHOST, waiting another 5 secs..."
#     sleep 5
# done

# ------------
# get network config
# ------------

IP=$(ip address show dev $HWLINK | grep "inet " | awk '{print $2}')
NETWORK=$(ip -o route | grep $HWLINK | grep -v default | awk '{print $1}')
GATEWAY=$(ip -o route | grep default | awk '{print $3}')

echo "IP: $IP"
echo "Network: $NETWORK"
echo "Gateway: $GATEWAY"
# ------------
# setting up $MACVLN interface
# ------------

ip link add link $HWLINK $MACVLN type macvlan mode bridge
ip address add $IP dev $MACVLN
ip link set dev $MACVLN up

# ------------
# routing table
# ------------

# empty routes
ip route flush dev $HWLINK
ip route flush dev $MACVLN

# add routes
ip route add $NETWORK dev $MACVLN metric 0

# add the default gateway
ip route add default via $GATEWAY
# ip route add default via $GATEWAY dev $HWLINK

