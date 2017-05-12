#!/bin/bash

hcitool scan |grep -v Scann >>/etc/security/bluesscan.conf
vim /etc/security/bluesscan.conf

echo '#auth    sufficient                      pam_blue.so' >>/etc/pam.d/common-auth
echo '#auth    requisite                      pam_blue.so' >>/etc/pam.d/common-auth

vim /etc/pam.d/common-auth
