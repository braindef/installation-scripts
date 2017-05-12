#!/bin/bash

echo processes:
echo --------------------
pgrep vlc
echo --------------------
echo ====================

echo -n "remove all vlc processes (y/n) "
read answer
if echo "$answer" | grep -iq "^y" ;then
sudo kill -9 $(pgrep vlc)
else
    echo not killing processes
fi

echo removing modules
sudo rmmod -f uvcvideo
sudo rmmod -f videobuf2_core
sudo rmmod -f v4l2_common

echo reloading modules
sudo modprobe v4l2_common
sudo modprobe videobuf2_core
sudo modprobe uvcvideo

echo done
