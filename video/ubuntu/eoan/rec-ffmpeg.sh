#!/bin/bash

dir=$(date +%y%m%d%H%M%s)

read -n 1 -s -r -p "press any key to create $dir and start record, to stop press again any key"
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
