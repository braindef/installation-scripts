#!/bin/bash

#was soll das hier????:
#explizit crasht der vlc das video system, somit kann ein kind das erfolgreicht mit trial und error die ganze map lernt getriggert werden
#/was soll dass hier

#workarround automatisch ohne reboot, usb video system neu starten:
#./reset.sh

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
  cvlc v4l2:// :v4l2-dev=$i :v4l2-width=352 :v4l2-height=288 v4l2-fps=5 :adev=null --sout "#transcode{vcodec=mjpg,vb=128} :duplicate{dst=std{access=http,mux=ts,dst=:808$var}}" &
var=$((var+1))
done

sleep 2

for j in 0
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

#x-tile g 2 2
#gnome-system-monitor
