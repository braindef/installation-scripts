sudo mdadm --detail  /dev/md127
sudo mdadm --assemble /dev/md0 --scan --force
mdadm --assemble --scan -v
