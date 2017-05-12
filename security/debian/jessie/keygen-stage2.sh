#!/bin/bash



cp /etc/ssh/sshd_config /etc/ssh/sshd_config.old

echo "AuthenticationMethods publickey,password" >> /etc/ssh/sshd_config
