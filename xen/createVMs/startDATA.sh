#!/bin/bash

xl list

sleep 3

xl create /etc/xen/data.cfg

echo -e "

to leave console type\e[32m {Ctrl} {AltGr} + ] \e[39msimultaneously

"


xl console data

