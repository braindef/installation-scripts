#!/bin/bash

cp /etc/apt/sources.list /etc/apt/sources.list-$(date +%y%m%d%H%M%S)


sed -e 's/jessie/stretch/g' /etc/apt/sources.list
sed -i -e 's/jessie/stretch/g' /etc/apt/sources.list


apt-get update
apt-get dist-upgrade
apt-get upgrade
apt-get autoremove

