cd /usr/src/linux

make menuconfig

make -j8 && make modules_install && make install

emerge --ask sys-kernel/genkernel

vim /etc/fstab

genkernel all

emerge --ask sys-kernel/linux-firmware

