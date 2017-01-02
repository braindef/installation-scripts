#!/bin/sh

PATH=/usr/sbin:/sbin:/bin:/usr/bin

#
# delete all existing rules.
#
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X

# Always accept loopback traffic
iptables -A INPUT -i lo -j ACCEPT


# Allow established connections, and those not coming from the outside
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state NEW -i ! wlan1 -j ACCEPT
iptables -A FORWARD -i wlan1 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow outgoing connections from the LAN side.
iptables -A FORWARD -i eth1 -o wlan1 -j ACCEPT

# Masquerade.
iptables -t nat -A POSTROUTING -o wlan1 -j MASQUERADE

# Don't forward from the outside to the inside.
iptables -A FORWARD -i wlan1 -o wlan1 -j REJECT

# Enable routing.
echo 1 > /proc/sys/net/ipv4/ip_forward

sudo apt-get -y install pdns-recursor
