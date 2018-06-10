USE="systemd" emerge --ask sys-kernel/gentoo-sources

cd /usr/src/linux

echo NEDD SYSTEMD

make menuconfig

make -j8 && make modules-install
make install


USE="systemd" emerge --ask --update --newuse --verbose sys-boot/grub:2

emerge --ask --unmerge sys-kernel/genkernel

emerge --ask sys-kernel/dracut

emerge --ask sys-kernel/genkernel-next

genkernel --install all

echo 'add_dracutmodules+="usrmount"' >> /etc/dracut



