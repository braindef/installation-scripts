sudo patch /usr/src/linux-4.18.6/drivers/pinctrl/intel/pinctrl-intel.c patch1.diff 
sudo patch /usr/src/linux-4.18.6/drivers/pinctrl/intel/pinctrl-cannonlake.c patch2.diff
sudo make -j10 && sudo make modules -j10
sudo make install && sudo make modules_install

