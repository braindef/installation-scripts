#!/bin/bash

dir=$(date +%y%m%d%H%M%s)

red="\e[91m"
green="\e[92m"
iBlue="\e[44m"
default="\e[39m"
iDefault="\e[49m"

echo -e "

${red}WARNING${default}: they often put old pedophile people in your stream when you would like
         to pay back what you have consumed even if you have only consumed equal
         aged content. First in this case they dont want you to payback what
         you have consumed, so that they can say it is fair to continue using
         you as lab-rat. In that case you can feel honored somehow, because
         ${red}the pedophile 1970s and older people seem to respect or even fear your skills${default}.
         The problem would be, that in this case the chance that you get hurt or
         even die when they make their experiments with you the people that
         consumed your content would be or at least feel guilty too. Since
         i don't feel bad if younger and equal aged people consume my content,
         at least the younger people are not guilty, but the older are.
         Details you can find in ${green}HackersCardagme${default}
	 ${iBlue}https://marclandolt.ch/HackersCardgame3/jpg/EN/#mos2${iDefault} (if my webserver is gone -> archive.org)

USED CAMS:
5x Bus 001 Device 007: ID 046d:0825 Logitech, Inc. Webcam C270
-> you will need an usb31 to usb20 adapter since it has only 4 normal usb
-> and some 3m usb20 extension cables

USED LAPTOP:
1x ASUS GL703GE (6-core)

OPERATING SYSTEM
Ubuntu eoan

"

read -n 1 -s -r -p "press any key to create $dir and start record,
to stop press again any key"
mkdir ./$dir
cd $dir
var=0
for i in $(ls /dev/video*)
do
  echo $var
  #ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset ultrafast -c:v libx264 cam$var.mjpg &
  #ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset ultrafast -c:v mpeg4 cam$var.mjpg &
  #ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset ultrafast -c:v libx265 cam$var.mjpg &
  if [ "$i" == "/dev/video0" ]
    then
      #continue
      echo continue
  fi
  ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x960 -i $i -preset fast -c:v libx264 cam$var.mjpg &
  #ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset fast -c:v libx264 cam$var.mjpg &
  #ffmpeg -f v4l2 -input_format mjpeg -framerate 30 -video_size 1280x720 -i $i -preset fast -c:v libx265 cam$var.mjpg &
  var=$((var+1))
done

arecord -f cd audio.wav &

read -n 1 -s -r -p "Press any KEY to stop"
killall ffmpeg
killall arecord
sleep 10

echo
echo
echo

echo after you recorded, you can edit it, the pedophile 1960er generation
echo 'bricked kdenlive for this usecase. you can use ./convert <dir>'
echo 'to work around the problem'
echo 
echo still some color, issues to fix, but maybe you could do this with
echo 'a video filter so far eg. denoiser (both 50%) white balance (30%)'
echo you know that maybe betther than i
echo
