#!/bin/bash

sudo apt-get install v4l-utils

red="\e[91m"
default="\e[39m"

for i in $(ls /dev/video*)
do
  echo -e ${red}$i${default}
  #v4l2-ctl -d $i --list-formats
  v4l2-ctl -d $i --list-formats-ext |grep 1280 |grep 720
done
