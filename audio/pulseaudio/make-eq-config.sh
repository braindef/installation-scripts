

echo "
load-module module-equalizer-sink
load-module module-dbus-protocol
" >> /etc/pulse/default.pa 

pulseaudio --kill

pulseaudio --start

vim /etc/pulse/default.pa
