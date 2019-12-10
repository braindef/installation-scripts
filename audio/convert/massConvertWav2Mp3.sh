#!/bin/bash
find . -exec ffmpeg -i '{}' -acodec libmp3lame '{}'.mp3 \;
