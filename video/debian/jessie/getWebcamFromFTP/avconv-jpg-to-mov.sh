#!/bin/bash

COUNTER=0

for f in *.jpg;
 do let COUNTER=COUNTER+1
 echo $COUNTER
# mv $f file$(printf "%0*d\n"3 $COUNTER).jpg
mv $f file$(printf "%0*d\n" 5 $COUNTER).jpg
done

avconv -start_number 1 -framerate 10 -f image2 -i file%05d.jpg -b 65536k out.mov
