emerge --ask app-admin/sysklogd

rc-update add sysklogd default

emerge --ask sys-process/cronie

rc-update add cronie default

emerge --ask net-misc/dhcpcd

emerge --ask net-wireless/iw net-wireless/wpa_supplicant

echo 'GRUB_CMD_LINUX="init=/lib/systemd/systemd"' >> /etc/default/grub

systemctl daemon-reexec

systemd-machine-id-setup

env-update && source /etc/profile

systemctl enable systemd-networkd.service

systemctl --all --full

systemctl --failed

systemctl enable cron.target


