emerge --update sys-kernel/gentoo-sources

cd /usr/src/linux

make menuconfig

make -j8 && make modules_install && make install

emerge --ask sys-kernel/genkernel-next

vim /etc/fstab

genkernel all

emerge --ask sys-kernel/linux-firmware


