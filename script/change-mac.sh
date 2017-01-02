#!/bin/bash

	
sudo apt-get install macchanger

netstat -ei

sudo ifconfig wlan0 down
sudo macchanger -r wlan0
sudo ifconfig wlan0 up

netstat -ei
