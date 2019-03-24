#!/bin/bash
find . -size +50M -exec ffmpeg -i '{}' -acodec libmp3lame '{}'.mp3 \;
