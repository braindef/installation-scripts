#!/bin/bash
setfacl -m u:Debian-gdm:r /usr/bin/pulseaudio
reboot
