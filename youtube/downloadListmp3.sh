#!/bin/bash

youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $1

#youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PLWsX0-AjlNWx0OSnVHjA61sKGRcaPpSIa

