
#!/bin/bash
sudo openssl genrsa -des3 -out /etc/gitlab/ssl/git.0x8.ch.key 2048

#sudo openssl req -new -key /etc/gitlab/ssl/git.0x8.ch.key -out /etc/gitlab/ssl/git.0x8.ch.csr

sudo openssl req -nodes -newkey rsa:2048 -keyout /etc/gitlab/ssl/git.0x8.ch.key -out /etc/gitlab/ssl/git.0x8.ch.csr

sudo cp -v /etc/gitlab/ssl/git.0x8.ch.{key,original}

sudo openssl rsa -in /etc/gitlab/ssl/git.0x8.ch.original -out /etc/gitlab/ssl/git.0x8.ch.key

sudo rm -v /etc/gitlab/ssl/git.0x8.ch.original

sudo openssl x509 -req -days 1460 -in /etc/gitlab/ssl/git.0x8.ch.csr -signkey /etc/gitlab/ssl/git.0x8.ch.key -out /etc/gitlab/ssl/git.0x8.ch.crt

sudo rm -v /etc/gitlab/ssl/git.0x8.ch.csr

sudo chmod 600 /etc/gitlab/ssl/git.0x8.ch.*
echo YOU NEED TO DO THE LAST COMMAND AS root
