#!/bin/bash
/bin/lsblk
apt-cache search mdadm
apt-get install mdadm
mdadm --create --verbose /dev/md/md --level=5 --raid-devices=4 /dev/sdf /dev/sdg /dev/sdh /dev/sdi
/bin/lsblk

