#!/bin/bash

ssh-keygen -t dsa

echo ohne Passwort


cat ~/.ssh/*.pub >> ~/.ssh/authorized_keys


chmod 700 ~/.ssh/authorized_keys


