#!/bin/bash

#lmms qSynth mixxx

clear

#codename=jessie
codename=stretch

echo "script configured for Debian $codename"
fontSourceDir="~/Daten.2015/Buero/Vorlagen/fonts"

apt-get update
apt-get upgrade

echo 
echo 
echo
echo -e "Bitte mit sudo starten, z.B.: \e[91msudo ./install.sh\e[39m, sudo muss zuerst installiert werden mit 'apt-get -y install sudo'?"
echo -e "Run with sudo, eg: \e[91msudo ./install.sh\e[39m, you must install sudo first with 'apt-get -y install sudo'?"

printf "continue? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;
then
  echo "weiter..."
  echo "continuing..."
else
  exit
fi


git clone git://github.com/Ardour/ardour.git


jack_control start




xdg-open https://www.youtube.com/watch?v=N5C65LvZ7ws

