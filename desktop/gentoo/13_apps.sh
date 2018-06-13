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

echo ' you should add
LC_CTYPE="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
LANG="en_US.UTF-8"
to your /etc/default/locale'

echo ' you should add
Section "InputClass"
        Identifier "touchpad catchall"
        Driver "synaptics"
        MatchIsTouchpad "on"
        Option "VertEdgeScroll" "on"
        Option      "CircularScrolling"         "on"
        Option      "VertScrollDelta"          "-111"
        Option      "HorizScrollDelta"         "-111"
        Option      "TapButton1"       	          "1"
EndSection
to your /etc/X11/xorg.conf.d/50-synaptics.conf'

