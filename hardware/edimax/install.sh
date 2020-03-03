#!/bin/bash
sudo cp 70-persistent-net.rules /etc/udev/rules.d/70-persistent-net.rules
sudo /etc/init.d/udev restart
