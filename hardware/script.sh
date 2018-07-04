#!/bin/bash

cd nvhda
make
sudo make install
sudo make -f Makefile.dkms

sudo apt-get install nvidia-384

