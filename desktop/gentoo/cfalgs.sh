#copy to /mnt/gentoo/etc/portage/make.conf

CFLAGS="-march=native -O2 -pipe"

# Use the same settings for both variables
CXXFLAGS="${CFLAGS}"

# build on 8 CPU cores
MAKEOPTS="-j8"

# build ninjabuild only with one core otherwise it will fail to build webkit-gtk for gnome
NINJAOPTS="-j1"
