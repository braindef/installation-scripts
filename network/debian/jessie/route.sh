#!/bin/sh
sudo xl create /etc/xen/data.cfg
sudo xl create /etc/xen/zabbix.cfg

sudo route del default gw 192.168.179.3 dev eth0
sudo route del default gw 192.168.179.1 dev eth0 metric 10
sudo route del -net 192.168.179.0/24 dev eth0
sudo route add -net 192.168.179.0/24 xenbr0
sudo route add default gw 192.168.179.3 xenbr0
sudo route add default gw 192.168.179.1 xenbr0 metric 10
#sudo route add default gw 192.168.179.2 xenbr0
sudo route

ping -c 3 www.google.com
ping -c 3 192.168.179.1
ping -c 3 192.168.179.3
ping -c 3 192.168.179.2
ping -c 3 192.168.179.111
ping -c 3 192.168.179.156
ping -c 3 192.168.179.166
ping -c 3 192.168.179.146
ping -c 3 192.168.1.1
ping -c 3 192.168.1.12


