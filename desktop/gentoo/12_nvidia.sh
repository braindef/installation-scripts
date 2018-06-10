
vim /usr/src/linux/.config -c "/CONFIG_DEBUG_MUTEXES"

echo dann make -j8 && make modules-install
echo dann make install

echo dann genkernel (der genkernel-next) 
echo genkernel --no-clean all

