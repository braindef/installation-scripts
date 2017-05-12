#!/bin/bash
sudo apt-get install cclive mpg123 vlc

mkdir workingDir
cd workingDir

for i in $(cat ../list.txt); do cclive $i;done

IFS=$'\n'       # make newlines the only separator

for i in $(ls); do ../convert.sh $i; done

echo Bitte [ENTER] drücken
read

mpg123 *.mp3
