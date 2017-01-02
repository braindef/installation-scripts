#!/bin/bash


echo for debian jessie

ifconfig

sleep 2

xl list

cp /etc/network/interfaces /etc/network/interfaces.$(date +%y%m%d%H%M%S)

echo -e "

this script appends the lines, maybe you have to\e[33m deactivate (#) older lines\e[39m

modify\e[33m /etc/network/interfaces\e[39m for you?\e[32m [y/n]\e[39m
"
read answer

if echo "$answer" | grep -iq "^y";
then 
  echo "
auto eth0
allow-hotplug eth0


auto xenbr0
allow-hotplug xenbr0
iface xenbr0 inet static
  bridge_ports eth0
  address 192.168.1.202
  broadcast 192.168.1.255
  netmask 255.255.255.0
  gateway 192.168.1.1
  dns-nameservers 192.168.1.1
" >>/etc/network/interfaces
else
  echo "dont edit /etc/network/interfaces for you"
fi


vim -c "syntax on" /etc/network/interfaces

echo -e "


in\e[32m /etc/xen/xl.conf\e[39m you must uncomment

vif.default.script=vif-bridge
vif.default.bridge=xenbr0 => the bridging device we defined before, like a physical switch

(remove the leading #)

you find more details to that on https://wiki.xenproject.org/wiki/Xen_Networking


Press [ENTER] to continue
"
read answer

vim -c "syntax on" /etc/xen/xl.conf


echo -e "

restart \e[32m network interfaces?\e[39m [y/n]"

read answer

if echo "$answer" | grep -iq "^y";
then 
ifdown eth0
ifdown eth1
ifdown xenbr0

ifup xenbr0
fi

ifconfig

echo "# More loop-devices
options loop max_loop=64" > /etc/modprobe.d/loop.conf

lsmod
modprobe loop
lsmod |grep loop

echo -e "

Edit\e[33m /etc/resolv.conf\e[39m for you? [y/n]"

read answer

if echo "$answer" | grep -iq "^y";
then 
  echo "
nameserver 192.168.1.1     #edge router 1
nameserver 192.168.1.3     #edge router 2
nameserver 91.138.1.128    #provider dns1
nameserver 91.138.126.128  #provider dns2
nameserver 8.8.8.8         #google dns, maybe not the best idea
" >>/etc/resolv.conf
else
  echo not modifying resolv.conf
fi


vim -c "syntax on" /etc/resolv.conf


cd ./role.d
./createROLES.sh

