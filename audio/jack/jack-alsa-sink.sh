#!/bin/bash

echo start jack2 server please, then press enter
read


#this 2 lines can be added to qjackCtl: 
#pactl load-module module-jack-sink channels=2 && pactl load-module module-jack-source

pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source



Jamulus --server &
Jamulus 
