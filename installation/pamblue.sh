#!/bin/bash

hcitool scan |grep -v Scann >>/etc/security/bluesscan.conf
vim /etc/security/bluesscan.conf

vim /etc/pam.d/common-auth
