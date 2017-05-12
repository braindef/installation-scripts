#!/bin/bash

sudo apt-get install python-pip

sudo pip install youtube-dl

for i in $(cat faun.txt); do youtube-dl --extract-audio --audio-format mp3 $i; done;
