#!/bin/bash

xl list

sleep 3

xl create /etc/xen/zabbix.cfg

echo -e "

to leave console type\e[32m {Ctrl} {AltGr} + ] \e[39msimultaneously

Press [ENTER] to continue
"
read answer

xl console zabbix

