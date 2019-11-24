#!/bin/bash

dir=$(date +%y%m%d%H%M%s)
mkdir ./$dir
cd $dir
var=0
for i in $(ls /dev/video*)
do
  echo $var
  ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 640x480 -i $i -c:v libx264 -vf format=yuv420p cam$var.mjpg &
  var=$((var+1))
done
