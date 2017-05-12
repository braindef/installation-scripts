#!/bin/bash
ping gateway -c 1 -W 1
route del default
route add default gw $1
ping gateway -c 1
ping 8.8.8.8 -c 1
apt-get install dnsutils
dig @gateway marclandolt.ch
