#!/bin/bash

CIDR=$1

if [ -z $CIDR ]; then
    echo "ERROR: Please specify the target CIDR as argument for $0"
    exit 1
fi

SKEL=$(echo $CIDR | cut -d '.' -f 1,2,3)
MYIP=$(echo $CIDR | cut -d '/' -f 1)

is_reachable() {
    # Verify if host is reachable at the given address.
    #
    # Params:
    # 1. HOST: Address to scan
    #

    HOST=$1

    if [ -z $HOST ]; then
        echo "ERROR: No host given to ping."
        return
    fi

    if [ "$HOST" == "$MYIP" ]; then
        return
    fi

    ping -W 0.2 -c 1 $HOST > /dev/null
    if [ $? -eq 0 ]; then
        echo $HOST
    fi
}

for i in ${SKEL}.{1..254}; do
    is_reachable $i &
done
