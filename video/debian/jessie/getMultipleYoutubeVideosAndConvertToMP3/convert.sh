#!/bin/bash

cvlc -I dummy "$1" --sout="#transcode{acodec=mp3,vcodec=dummy}:standard{access=file,mux=raw,dst=$1.mp3}" vlc://quit &

