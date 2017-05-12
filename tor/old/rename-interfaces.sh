#!/bin/bash
#echo -n "# " >>
ifconfig | grep ether  >> /etc/udev/rules.d/70-persistent-net.rules
vim /etc/udev/rules.d/70-persistent-net.rules

