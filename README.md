# netexplore

netexplore is a suite of Linux command-line scripts aimed at exploring the network, i.e. find alive hosts.

## Tools description
### get_net_addr
* Objective: Retrieve IPv4 Address and netmask from the given network interface.
* Arguments:
    1. `IFACE`: target network interface.

### explore
* Objective: Scan the network for alive hosts using ICMP-based `ping` utility.
* Arguments:
    1. `CIDR`: CIDR to scan.
* Caveats:
    * Currently, only `/24` netmasks are supported.
