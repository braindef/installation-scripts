#!/bin/bash

apt-get install wget build-essential libpcre3-dev libpcre3-dbg automake autoconf libtool libpcap-dev libnet1-dev libyaml-dev zlib1g-dev libcap-ng-dev libjansson-dev ethtool

/sbin/ethtool -K eth0 gro off lro off

sleep 5

/etc/init.d/suricata restart
/etc/init.d/suricata status

sleep 5

suricata --build-info

sleep 5

/usr/bin/suricata --list-runmodes

