sudo apt-get install cclive vlc x-tile 
cclive "https://www.youtube.com/watch?v=dPyfCcxR8qw"
sleep 1
wait=0.6463
for i in 1 2 3 4 5 6 7 8
do
  if ! ((i % 2))
  then
    cvlc ./Hau* &
  fi
  sleep $wait
done

x-tile g 2 2

