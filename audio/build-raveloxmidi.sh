#!/bin/bash
sudo apt-get install autoconf automake build-essential libavahi-client-dev libasound2-dev

cd pimidi/raveloxmidi
cat INSTALL

echo run ./autogen.sh
echo you maybe need to run ./configure --enable-alsa
echo run make
echo run sudo make install

echo to remove run sudo make uninstall
