#!/bin/bash

#was soll das hier????:
#explizit crasht der vlc das video system, somit kann ein kind das erfolgreicht mit trial und error die ganze map lernt getriggert werden
#/was soll dass hier

#workarround automatisch ohne reboot, usb video system neu starten:
./reset.sh

dir=$(date +%y%m%d%H%M%s)
mkdir ./$dir
cd $dir
var=0
for i in $(ls /dev/video*)
do
  
  echo $var
  echo "*******************************************************************"
  echo "                           instance $i"
  echo "*******************************************************************"
  vlc v4l2:// :v4l2-dev=$i :v4l2-width=1280 :v4l2-height=720 :adev=:0,0 --sout "#transcode{vcodec=MJPG,vb=3000,scale=1,acodec=mpga,ab=128,channels=1} :duplicate{dst=std{access=http,mux=ts,dst=:808$var}, dst=std{access=file,dst=./Cam$var.avi}, dst=display}" &
var=$((var+1))
done

sleep 2

for j in 0 1 2
do
  echo "*******************************************************************"
  echo "                           player $j"
  echo "*******************************************************************"
#  /usr/bin/mplayer http://localhost:808$j &
  echo "*******************************************************************"
done

#sleep 2

#sudo apt-get install x-tile

sleep 2

x-tile g 2 2
gnome-system-monitor
