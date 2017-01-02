


#!/bin/bash

apt-get update

apt-get upgrade

apt-get install sudo vim

#GNU Debian Jessie
apt-get install xen-system-amd64 xen-utils-4.4 xen-utils-common xen-tools bridge-utils xen-hypervisor-4.4-amd64

#GNU Debian Stretch
apt-get install xen-system-amd64 xen-utils-4.8 xen-utils-common xen-tools bridge-utils xen-hypervisor-4.8-amd64


echo -e "\n\n\n\n\n\n
vim /etc/default/grub
*******************************************************************
change the line  GRUB_DEFAULT=0 to (in my case) 2 = 3rd row in the boot-menu

the key [a] you can append to the config-file

then save with [ESC]:wq (Escape changes to command mode, w stands for write, q stands for quit)
 

Press [ENTER] to continue
"
read

vim -c "syntax on" /etc/default/grub
 
update-grub
