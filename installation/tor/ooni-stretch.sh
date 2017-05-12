#!/bin/bash
rm -rfv ./ooni-probe/


sudo apt-get install python-pip python-virtualenv virtualenv
sudo apt-get install libgeoip-dev libffi-dev libdumbnet-dev libssl-dev libpcap-dev
git clone https://github.com/TheTorProject/ooni-probe
cd ooni-probe
virtualenv venv

source venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-dev.txt
python setup.py install
ooniprobe -s


cd ~
mkdir my_decks
ooniresources --update-inputs --update-geoip
oonideckgen -o my_decks/

/usr/local/bin/ooniprobe -i /root/my_decks/web-full.yaml

echo "

start ooniproble 4x per day (crontab entry)?"
read input
if echo $input  |grep -iq ^y
then
(crontab -l 2>/dev/null ; echo "$(( ( RANDOM % 59 )  + 1 )) $(( ( RANDOM % 23 )  + 1 )) * * * ~/installation-scripts/tor/ooni-probe/venv/bin/ooniprobe -i ~/my_decks/web-full.yaml") | crontab -

(crontab -l 2>/dev/null ; echo "$(( ( RANDOM % 59 )  + 1 )) $(( ( RANDOM % 23 )  + 1 )) * * * ~/installation-scripts/tor/ooni-probe/venv/bin/ooniprobe -i ~/my_decks/web-full.yaml") | crontab -

(crontab -l 2>/dev/null ; echo "$(( ( RANDOM % 59 )  + 1 )) $(( ( RANDOM % 23 )  + 1 )) * * * ~/installation-scripts/tor/ooni-probe/venv/bin/ooniprobe -i ~/my_decks/web-full.yaml") | crontab -

(crontab -l 2>/dev/null ; echo "$(( ( RANDOM % 59 )  + 1 )) $(( ( RANDOM % 23 )  + 1 )) * * * ~/installation-scripts/tor/ooni-probe/venv/bin/ooniprobe -i ~/my_decks/web-full.yaml") | crontab -

fi
~/installation-scripts/tor/ooni-probe/venv/bin/ooniprobe -i ~/my_decks/web-full.yaml

