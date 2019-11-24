#!/bin/bash

dir=$(date +%y%m%d%H%M%s)

red="\e[91m"
default="\e[39m"

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
  ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset ultrafast -c:v libx264 cam$var.mjpg &
  var=$((var+1))
done

read -n 1 -s -r -p "Press any KEY to stop"
killall ffmpeg
