#!/bin/bash

IFACE=$1 # The given network interface

if [ -z $IFACE ]; then
    echo "Please specify the interface as the argument for $0"
    exit 1
fi

ip addr show dev $IFACE | \
    grep -o 'inet [0-9\.]\+/[0-9]\+' | \
    cut -d ' ' -f 2
