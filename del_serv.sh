#!/bin/bash

service_name=$1
ns=$2

ip link delete $service_name
ip netns delete $ns
