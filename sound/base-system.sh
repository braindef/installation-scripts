#!/bin/bash

echo "
sudo apt-get install build-essential
sudo apt-get install libglib2.0-dev
sudo apt-get install libpango1.0-dev
sudo apt-get install libcairo2-dev
sudo apt-get install libglu1-mesa-dev
sudo apt-get install lv2-dev 
sudo apt-get install libfluidsynth-dev
sudo apt-get install jackd
sudo apt-get install qjackctl
sudo apt-get install a2jmidid
sudo apt-get install ardour3
sudo apt-get install ardour

"

#Section Software Synthesizer / Sampler addons/software/plugins 
#sudo apt-get install phasex
#sudo apt-get install fluidsynth
#sudo apt-get install qsynth

#$(which jackd) &

$(which qjackctl) &

sleep 3

echo -e "


	\e[92m▶\e[0m Start


press \e[33mENTER in this terminal-window\e[0m when your jackd server is started

"
read $input

#Section starting the jack-midi backend as a background process
$(which a2jmidid) -j default &
$(which a2j_control) start &

#Secion starting the software Synthesizers
$(which fluidsynth) &
$(which phasex) &

echo "to compile avldrums

git clone git://github.com/x42/avldrums.lv2.git
cd avldrums.lv2
make submodules
make
sudo make install PREFIX=/usr
"

$(which ardour2)

$(which ardour3)


