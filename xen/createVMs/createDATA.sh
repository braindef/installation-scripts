#!/bin/bash


 
#/usr/bin/xen-create-image --hostname data --ip 192.168.179.203 --gateway 192.168.179.1 --netmask 255.255.255.0 --size=5Gb --swap=1Gb --memory=1024Mb --arch=amd64 --role=udev,default --dir=/home/xen --genpass_len=8 --verbose


/usr/bin/xen-create-image --hostname data --ip 192.168.179.203 --gateway 192.168.179.1 --netmask 255.255.255.0 --size=5Gb  --swap=1Gb --memory=1024Mb --arch=amd64 --role=udev,default --dir=/home/xen --password=1234567 --verbose
