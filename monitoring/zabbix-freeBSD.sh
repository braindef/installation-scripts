#!/bin/bash

echo not working yet

sleep 5

pkg install apache22 php55 zabbix3-server zabbix3-frontend nmap vim-lite sudo wget

echo "

# User privilege specification
root    ALL=(ALL:ALL) ALL
marc    ALL=(ALL:ALL) ALL
" >>/etc/sudoers

#apt-get update

#apt-get upgrade

#apt-get install snmp-mibs-downloader

#apt-get install zabbix-server-pgsql zabbix-frontend-php nmap vim sudo vim 

nmap localhost | grep 5432

read -p "Press [Enter] to continue"

cd /var/lib/postgresql/

sudo -u postgres  psql -c "CREATE DATABASE zabbix;"

sudo -u postgres  psql -c "CREATE USER zabbix WITH PASSWORD '1234';"

sudo -u postgres  psql -c "GRANT ALL PRIVILEGES ON DATABASE zabbix to zabbix;"

gunzip --stdout /usr/share/zabbix-server-pgsql/schema.sql.gz | psql -h localhost -U zabbix -d zabbix -W
gunzip --stdout /usr/share/zabbix-server-pgsql/images.sql.gz | psql -h localhost -U zabbix -d zabbix -W 
gunzip --stdout /usr/share/zabbix-server-pgsql/data.sql.gz | psql -h localhost -U zabbix -d zabbix -W

/usr/sbin/zabbix_server -n 1 -c /etc/zabbix/zabbix_server.conf

echo "
NodeID=1
ListenPort=10051
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=1234
" >> /etc/zabbix/zabbix_server.conf

vim /etc/default/zabbix-server

ln -s /usr/share/zabbix /var/www/html

echo "
max_execution_time = 300
memory_limit = 128M
post_max_size = 16M
upload_max_filesize = 2M
max_input_time = 300
date.timezone = Europe/Zurich
" >> /etc/php5/apache2/php.ini

/etc/init.d/apache2 restart

chmod o+w /etc/zabbix

read -p "Press [Enter] after doing zabbix frontend installation on http://<Server IP>/zabbix/"

chmod o-w /etc/zabbix

