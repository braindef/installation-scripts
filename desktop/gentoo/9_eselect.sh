cd /usr/src/linux

make menuconfig

make -j8 && make modules_install && make install


#NINJAOPTS="-j1" emerge webkit-gtk gnome gnome-terminal nautilus rsync gedit vim git sudo
