#!/bin/bash
emerge --update gdm gnome gnome-terminal nautilus --autounmask-write
etc-update
emerge --update gdm gnome gnome-terminal nautilus

#read -n1 -r -p "Press any key to continue or ctrl-c and make menuconfig" key

emerge --update firefox
emerge --update chromium
emerge --update inkscape gimp thunderbird vlc libreoffice keepass
emerge --update app-portage/gentoolkit-next

vim /etc/locale.conf
systemctl enable dbus

