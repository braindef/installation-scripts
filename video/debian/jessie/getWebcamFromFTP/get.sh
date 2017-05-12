#!/bin/bash

for i in cam cam2 cam3 cam4 cam5 cam6
 do
  rsync -avz --remove-source-files marcland@ftp.marclandolt.ch:/home/marcland/public_html/$i .
  rsync -avz ./template/display.php marcland@ftp.marclandolt.ch:/home/marcland/public_html/$i/
 done


