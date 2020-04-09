#!/bin/bash
pactl unload-module module-jack-sink
pactl unload-module module-jack-source


pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source channels=2


/usr/bin/guitarix &
