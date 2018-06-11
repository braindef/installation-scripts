
mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf

chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"
echo muss man von hand machen sonst ist der chroot nur im shellscript
