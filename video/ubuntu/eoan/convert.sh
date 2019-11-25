#!/bin/bash

echo "1: x$1x"


if ["$1" = ""]
then
    echo "
    useage:
      ./convert.sh <directory>

    example:
      ./convert.sh 19112504501574653840
"
else
  for i in $(find $1)
    do
      ffmpeg -i $i -framerate 24 $i.mp4
    done
fi

