#!/bin/bash

echo lot of things change, maybe you have to debug it
 
#orangePI
 
sudo apt-get install python-pip python-dev libdumbnet1 libdumbnet-dev libpcap-dev
 
#added line for OrangePI PC:
sudo apt-get install libffi-dev
 
 
sudo apt-get purge python-pyasn1
sudo apt-get install sip
sudo apt-get install sip-dev
#sudo pip install sip
#sudo pip install sip-dev
 
 
sudo pip install cryptography
 
sudo pip install pyopenssl
 
sudo pip install scapy pypcap txsocksx pyasn1
 
sudo pip install https://github.com/TheTorProject/ooni-probe/archive/master.zip
 
cd ~
mkdir my_decks
ooniresources --update-inputs --update-geoip
oonideckgen -o my_decks/
 
#fuer die SCHWEIZ -> CH (Ländercode)
(crontab -l 2>/dev/null ; echo @daily /usr/local/bin/ooniprobe -i ~/my_decks/deck-ch/default-user.deck) | crontab -
 
echo "http://www.marclandolt.ch" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://www.marclandolt.ch/ml_buzzernet" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://marclandolt.ch" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://marclandolt.ch/ml_buzzernet" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://www.ignored.ch" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://www.ignored.ch/ml_buzzernet" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
 
 
ooniresources --update-inputs --update-geoip
oonideckgen -o my_decks/


