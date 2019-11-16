#!/bin/bash

youtube-dl -i -o "%(title)s.%(ext)s" $1

#youtube-dl -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PLWsX0-AjlNWx0OSnVHjA61sKGRcaPpSIa

