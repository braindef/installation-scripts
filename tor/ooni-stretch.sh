#!/bin/bash
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

