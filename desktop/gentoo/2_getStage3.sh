wget http://distfiles.gentoo.org/releases/amd64/autobuilds/20180607T214503Z/stage3-amd64-20180607T214503Z.tar.xz
unxz stage3-amd64-20180607T214503Z.tar.xz
tar xpf stage3-*.tar --xattrs-include='*.*' --numeric-owner

cp /installation-scripts/desktop/gentoo/make.conf /mnt/gentoo/etc/portage/make.conf
