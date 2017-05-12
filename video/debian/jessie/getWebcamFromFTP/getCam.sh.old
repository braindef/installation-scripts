#!/bin/bash

for i in $(echo cam cam2 cam3 cam4 cam5)

do

  rsync -avz --remove-source-files marcland@ftp.marclandolt.ch:~/public_html/$i .

  rsync -avz display.php  marcland@ftp.marclandolt.ch:~/public_html/$i/display.php

done
