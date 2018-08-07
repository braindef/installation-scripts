#!/bin/bash

xrandr | grep connected | cut -d" " -f1
sudo apt-get install xinput x11-xserver-utils
xinput map-to-output $(xinput |grep Pen |grep stylus | cut -d= -f2 | cut -c1-2) DP-2
xinput map-to-output $(xinput |grep Pen |grep stylus | cut -d= -f2 | cut -c1-2) XWAYLAND1
