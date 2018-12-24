#/bin/bash
for i in *.wav; do lame -b 320 -h "${i}" "${i%.wav}.mp3" & done
