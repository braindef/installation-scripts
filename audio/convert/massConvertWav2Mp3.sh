#!/bin/bash
find . -size +20M -exec ffmpeg -i '{}' -acodec libmp3lame '{}'.mp3 \;
