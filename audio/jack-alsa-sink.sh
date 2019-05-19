#!/bin/bash

qjackctl &
echo start jack2 server please, then press enter
read
pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source
pacmd set-default-sink jack_out
./Jamulus --server &
./Jamulus
