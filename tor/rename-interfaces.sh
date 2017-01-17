#!/bin/bash
echo -n "# "
ifconfig | grep -a2 enp  >> /etc/udev/rules.d/70-persistent-net.rules
vim /etc/udev/rules.d/70-persistent-net.rules

