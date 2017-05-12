#!/bin/bash

codename=jessie

if  [ "$1" = "" ]
then
echo -e "
\e[39m
Usage:
------
Enter the (new) Database Password as parameter \e[36m./zabbix.sh 123456\e[39m

"
exit 0
fi


echo "script for Debian $codename"
echo 
echo
echo -e "Run with sudo, eg: \e[91msudo ./install.sh\e[39m, you must install sudo first with 'apt-get -y install sudo'?"
echo -e "Bitte mit sudo starten, z.B.: \e[91msudo ./install.sh\e[39m, sudo muss zuerst installiert werden mit 'apt-get -y install sudo'?"


printf "continue? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;
then
  echo "weiter..."
  echo "continuing..."
else
  exit
fi

dpkg --configure -a

printf "configure keyboard? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;
then
  dpkg-reconfigure keyboard-configuration
  echo changing keyboard configuration needs reboot [Press ENTER to continue]
else
  echo leaving keyboard as it is
fi


apt-get update
apt-get upgrade
apt-get install nmap vim sudo snmp snmpd

echo
echo -e "\e[91mzabbix-server-pgsql und zabbix-frontend-php\e[39m installieren? (y/n)?"
read answer

if echo "$answer" | grep -iq "^y" ;
then
  apt-get install postgresql-all
  apt-get install zabbix-server-pgsql
  apt-get install apache2
  apt-get install php

  apt-get install php5-pgsql
  apt-get install zabbix-frontend-php

  echo -e "\e[91mnon-free\e[39m required for snmp-mibs-downloader"
  read -p "Press [Enter] after adding it in /etc/apt/sources.list an an apt-get update && apt-get upgrade on another virtal console ([ctrl][alt][F2-F6])"

  apt-get install snmp-mibs-downloader
  echo -e "\e[91mpostgresql\e[39m reachable? (next line should show it, port 5432)
"
  nmap localhost | grep 5432
  read -p "Press [Enter] to continue"

else
  echo "not installing zabbix-server and frontend"
fi


cd /var/lib/postgresql/

echo
echo -e "\e[91mdrop old\e[39m database? (y/n)?"
read answer
if echo "$answer" | grep -iq "^y" ;then
sudo -u postgres  psql -c "drop database zabbix;"
else
    echo "not dropping old db"
fi

echo
echo -e "\e[91minstall\e[39m database? (y/n)?"
read answer
if echo "$answer" | grep -iq "^y" ;then
  sudo -u postgres  psql -c "CREATE DATABASE zabbix;"
  sudo -u postgres  psql -c "CREATE USER zabbix WITH PASSWORD '$1';"
  sudo -u postgres  psql -c "GRANT ALL PRIVILEGES ON DATABASE zabbix to zabbix;"
  gunzip --stdout /usr/share/zabbix-server-pgsql/schema.sql.gz | psql -h localhost -U zabbix -d zabbix -W
  gunzip --stdout /usr/share/zabbix-server-pgsql/images.sql.gz | psql -h localhost -U zabbix -d zabbix -W 
  gunzip --stdout /usr/share/zabbix-server-pgsql/data.sql.gz | psql -h localhost -U zabbix -d zabbix -W
else
  echo "not installing db"
fi

echo


echo -e "\e[91m/etc/zabbix/zabbix_server.conf\e[39m modifiziere? (y/n)?"
read answer
if echo "$answer" | grep -iq "^y" ;
then
echo "
NodeID=0
ListenPort=10051
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=$1
" >> /etc/zabbix/zabbix_server.conf
fi

echo
echo -e "\e[91m/etc/zabbix/zabbix_server.conf\e[39m editieren? (y/n)?"
read answer
if echo "$answer" | grep -iq "^y" ;then
  vim /etc/zabbix/zabbix_server.conf
else
    echo "not editing /etc/zabbix/zabbix_server.conf"
fi

echo
echo -e "\e[91m/etc/zabbix/zabbix_server.conf\e[39m kompillieren? (y/n)?"
read answer
if echo "$answer" | grep -iq "^y" ;then
  /usr/sbin/zabbix_server -c /etc/zabbix/zabbix_server.conf
  /usr/sbin/zabbix_server -n 1 -c /etc/zabbix/zabbix_server.conf
 
  echo press [ENTER] to continue
  read answer 
else
  echo "not compiling /etc/zabbix/zabbix_server.conf"
fi

vim /etc/default/zabbix-server
vim /etc/default/snmpd
vim /etc/snmp/snmpd.conf

ln -s /usr/share/zabbix /var/www/html

echo "
max_execution_time = 300
memory_limit = 128M
post_max_size = 16M
upload_max_filesize = 2M
max_input_time = 300
date.timezone = Europe/Zurich
always_populate_raw_post_data = -1
" >> /etc/php5/apache2/php.ini

echo "
max_execution_time = 300
memory_limit = 128M
post_max_size = 16M
upload_max_filesize = 2M
max_input_time = 300
date.timezone = Europe/Zurich
" >> /etc/php/7.0/apache2/php.ini

/usr/sbin/a2enmod php

/usr/sbin/a2dismod mpm_event
/usr/sbin/a2enmod php7.0

/usr/sbin/apache2ctl restart

/etc/init.d/apache2 restart

chmod o+w /etc/zabbix

xdg-open http://localhost/zabbix
read -p "Press [Enter] after doing zabbix frontend installation on http://<Server IP>/zabbix/"

chmod o-w /etc/zabbix

echo -e "
default user is \e[91mAdmin\e[39m (case sensitiv)
default password is \e[91mzabbix\e[39m (case sensitiv)
"

echo
echo -e "\e[91mZabbix-Agent\e[39m installieren? (y/n)?"
read answer
if echo "$answer" | grep -iq "^y" ;then
  apt-get install zabbix-agent
  vim /etc/zabbix/zabbix_agentd.conf
  /etc/init.d/zabbix-agent restart
else
  echo "not installing zabbix-agent"
fi

