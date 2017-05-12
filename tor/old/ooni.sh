#!/bin/bash



sudo apt-get install python-pip python-dev libdumbnet1 libdumbnet-dev libpcap-dev
sudo apt-get purge python-pyasn1 
sudo apt-get install sip
sudo apt-get install sip-dev
sudo apt-get install libffi-dev
sudo apt-get install libssl-dev
sudo apt-get install python-cryptography
sudo pip install cryptography
sudo pip install cryptography -U
sudo pip install sip
sudo pip install sip-dev
sudo pip install scapy pypcap txsocksx sip pyasn1
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
echo "http://www.google.com/patents/US4877027" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://www.google.com/patents/US6169924" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://www.google.com/patents/WO2005055579A1" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://www.google.com/patents/WO2005055579A1?cl=en" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://marclandolt.ch/ml_buzzernet/2015/10/16/zusammenfassung-von-pinkibrain/" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://marclandolt.ch/ml_buzzernet/2015/07/30/mental-operating-system-v1-0-0/" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "http://neuronexus.com/images/NeuroNexusCatalog.pdf" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt
echo "https://en.wikipedia.org/wiki/Jos%C3%A9_Manuel_Rodriguez_Delgado" >> /root/my_decks/deck-ch/citizenlab-urls-global.txt


#ooniresources --update-inputs --update-geoip
#oonideckgen -o my_decks/

/usr/local/bin/ooniprobe -i ~/my_decks/deck-ch/default-user.deck

/usr/bin/arm
