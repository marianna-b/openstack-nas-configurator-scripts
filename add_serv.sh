#!/bin/bash

service_name=$1
ns=$2
veth=S$1
vlan_id=$3
vlan_name=$1-$3
vlan_ip=$4

ip netns add $ns
ip link add $service_name type veth peer name $veth
ip link set $veth netns $ns
brctl addif bridge0 $service_name
ip link set dev $service_name up
ip netns exec $ns ip link set dev $veth up
#ip netns exec $ns ip addr add $veth_ip/24 dev eth0

ip netns exec $ns ip link add name $vlan_name link $veth type vlan id $vlan_id 
ip netns exec $ns ip addr add $vlan_ip/24 dev $vlan_name
ip netns exec $ns ip link set dev $vlan_name up
