emerge --ask sys-kernel/gentoo-sources

cd /usr/src/linux

echo asus croshair VI Board needs the IGB (intel network driver) need to CONFIG_IGB=y and then menuconfig again
echo edimax usb needs CONFIG_RTL8192CU=m and also a make menuconfig again

make menuconfig

make -j8 && make modules-install
make install

emerge --update --newuse --verbose sys-boot/grub:2

emerge --unmerge sys-kernel/genkernel

emerge --update sys-kernel/dracut

echo 'add_dracutmodules+="usrmount"' >> /etc/dracut

emerge --update sys-kernel/genkernel-next

genkernel --install all
