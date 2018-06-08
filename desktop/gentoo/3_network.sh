cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
for i in $(cat /proc/net/dev |cut -d: -f1 |grep -v lo |grep enp)
do
 dhcpcd $i -t 20
done
