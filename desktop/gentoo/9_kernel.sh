emerge --update sys-kernel/gentoo-sources

cd /usr/src/linux

echo you need to build kernel with systemd and uefi support
echo https://wiki.gentoo.org/wiki/Systemd
read -n1 -r -p "Press any key to continue or ctrl-c and make menuconfig" key

ln -sf /proc/self/mounts /etc/mtab


make menuconfig

make -j8 && make -j8 modules && make modules_install && make install

emerge --ask sys-kernel/genkernel-next

vim /etc/fstab

genkernel --install all

emerge --ask sys-kernel/linux-firmware

emerge -avDN @world
