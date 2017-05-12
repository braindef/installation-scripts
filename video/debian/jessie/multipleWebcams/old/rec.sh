#!/bin/bash

#x=320; y=240
#x=432; y=240
#x=544; y=288
#x=640; y=360
x=800; y=608
#x=1280; y=720

#sudo apt-get install v4l-conf v4l-utils 
#v4l2-ctl --list-devices
#v4l2-ctl --list-formats-ext

#explizit crasht der vlc das video system, somit kann ein kind das erfolgreicht mit trial und error die ganze map lernt getriggert werden workaround automatisch ohne reboot, usb video system neu starten:
sudo rmmod  uvcvideo
sudo rmmod videobuf2_core 
sudo rmmod v4l2_common
sudo modprobe v4l2_common 
sudo modprobe videobuf2_core 
sudo modprobe uvcvideo

dir=$(date +%y%m%d%H%M%s)
mkdir ./$dir

#for i in $(ls /dev/video*)
for i in $(seq 1 3)
do
  vlc v4l2:// :v4l2-dev=/dev/video$i :v4l2-width=$x :v4l2-height=$y \
	    --sout "#transcode{vcodec=VP80,vb=1500,deinterlace,acodec=vorb,ab=128,channels=2,samplerate=44100} \
            :standard{access=file,dst=standard.avi}" \
            :sout="#duplicate{dst=std{access=file,dst=./$dir/$i.avi}, dst=display}". &
done

#Fenster auf 2 Reihen und 2 Zeilen verteilen 
sudo apt-get install x-tile
sleep 6
x-tile q

echo to end press [ENTER]
#read
sleep 120
killall vlc
