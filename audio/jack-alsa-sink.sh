#!/bin/bash
jackd
pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source
pacmd set-default-sink jack_out
