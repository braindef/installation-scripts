emerge --update app-admin/sysklogd

systemctl enable sysklogd

emerge --update sys-process/cronie

systemctl enable cronie

systemctl enable cron.target

emerge --update net-misc/dhcpcd

emerge --update net-wireless/iw net-wireless/wpa_supplicant networkmanager

systemctl enable NetworkManager

echo 'GRUB_CMD_LINUX="init=/lib/systemd/systemd"' >> /etc/default/grub

systemctl daemon-reexec

systemd-machine-id-setup

env-update && source /etc/profile

systemctl enable systemd-networkd.service

systemctl --all --full

systemctl --failed




