#!/bin/bash

#/usr/bin/xen-create-image --hostname zabbix --ip 192.168.179.204 --gateway 192.168.179.1 --netmask 255.255.255.0 --size=20Gb --swap=4Gb --memory=2048Mb --arch=amd64 --role=udev,default,zabbix --dir=/home/xen --genpass_len=8 --verbose
/usr/bin/xen-create-image --hostname zabbix --ip 192.168.179.204 --gateway 192.168.179.1 --netmask 255.255.255.0 --size=20Gb --swap=4Gb --memory=2048Mb --arch=amd64 --role=udev,default,zabbix,development --dir=/home/xen --password=1234567 --verbose
