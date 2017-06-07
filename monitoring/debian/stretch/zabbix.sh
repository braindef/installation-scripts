#!/bin/bash

#Script for installing zabbix automated
#==============================================================================
#title           :
#description     :
#author		 :Marc Landolt, @FailDef
#date            :
#version         :0.1
#usage		 :
#notes           :
#bash_version    :
#documentation   : /usr/share/doc/zabbix-server-mysql/README.Debian
#                  /usr/share/doc/zabbix-server-pgsql/README.Debian
#                  /usr/share/doc/zabbix-frontend-php/README.Debian
#                  /usr/share/doc/zabbix-agent/README.Debian
#                  https://www.zabbix.com/documentation/3.0/manual
#==============================================================================


# Define Editor
#==============================================================================
#EDITOR=$(which nano)
EDITOR=$(which vim)
#==============================================================================


# Color Definitions
#==============================================================================
red="\e[91m"
default="\e[39m"
#==============================================================================


# Define which Linux Distribution
#==============================================================================
#distro=jessie
distro=stretch
#==============================================================================


# Helper Function to show first the command that is beeing executed
#==============================================================================
function ShowAndExecute {
#show command
echo -e "
${red}● $1 ${default}"
#execute command
$1
#test if it worked or give an ERROR Message in red, return code of apt is stored in $?
rc=$?; if [[ $rc != 0 ]]; then echo -e ${red}ERROR${default} $rc; fi
}
##test if everything worked
#==============================================================================


# Helper Function for YES or NO Answers
#------------------------------------------------------------------------------
# Example YESNO "Question to ask" "command to be executed"
#==============================================================================
function YESNO {
echo -e -n "
${red}$1 [y/N]${default} "
read -d'' -s -n1 answer
echo
if  [ "$answer" = "y" ] || [ "$answer" = "Y" ]
then
return 0
else
echo -e "
"
return 1
fi
}
#==============================================================================


# Test if script runs as root otherweise exit with exit code 1
#==============================================================================
if [[ $EUID -ne 0 ]]; then
  echo -e -n "
${red}You must be a root user to run this script${default}
at the moment you are " 2>&1
  id | cut -d " " -f1
  echo
  exit 1
fi
#==============================================================================


# Test if user has given enough parameters
#==============================================================================
if  [ "$1" = "" ] 
then
echo -e "
Usage:
------
Enter the (new) Database Password as parameter e.g. ${red}sudo ${0} 123456${default} "
echo
echo " arguments ---------------->  ${@}     "
echo " \$1 ----------------------->  $1       "
echo " \$2 ----------------------->  $2       "
echo " path to script ----------->  ${0}     "
echo " parent path -------------->  ${0%/*}  "
echo " script name -------------->  ${0##*/} "
echo
exit 0
fi
#==============================================================================

echo -e "${red}${0} ${@}${default}"

# get the newest updates
#==============================================================================
ShowAndExecute "cat -e /var/lib/dpkg/lock"

ShowAndExecute "apt --fix-broken install"

ShowAndExecute "dpkg --configure -a"

ShowAndExecute "apt-get -y update"

ShowAndExecute "apt-get -y upgrade"

ShowAndExecute "apt-get -y dist-upgrade"

ShowAndExecute "apt-get -y install sudo git vim nano"
#==============================================================================

# edit repository list
#==============================================================================
if YESNO "Edit /etc/apt/sources.list?"
then
ShowAndExecute "$EDITOR /etc/apt/sources.list"
fi

ShowAndExecute "apt-get -y install snmp"
ShowAndExecute "apt-get -y install snmpd"
ShowAndExecute "apt-get -y install nmap"
ShowAndExecute "apt-get -y install fping"
ShowAndExecute "chmod u+s /usr/bin/fping"


ShowAndExecute "apt-get -y install postgresql"
ShowAndExecute "apt-get -y install postgresql-all"
ShowAndExecute "apt-get -y install zabbix-server-pgsql"
ShowAndExecute "apt-get -y install apache2"
ShowAndExecute "apt-get -y install libapache2-mod-php"
ShowAndExecute "apt-get -y install php"
ShowAndExecute "apt-get -y install php-pgsql"
ShowAndExecute "apt-get -y install zabbix-frontend-php"

echo postfix should be open on port 5432
ShowAndExecute "nmap localhost"

if YESNO "The snmp-mibs-downloader needs non-free edit /etc/apt/sources.list for you? (in Ubuntu press NO)"
then
vim -c ":%s/main/main non-free/g" /etc/apt/sources.list
ShowAndExecute "apt-get -y update"
ShowAndExecute "apt-get -y upgrade"
fi
ShowAndExecute "apt-get -y install snmp-mibs-downloader"

if YESNO "drop old database completely?"
then
sudo -u postgres  psql -c "drop database zabbix;"
fi

if YESNO "install new database? (Password you entered is $1)"
then
password=\'${1}\' #ugly but no better idea at the moment
sudo -u postgres  psql -c "CREATE DATABASE zabbix;"
sudo -u postgres  psql -c "CREATE USER zabbix WITH PASSWORD ${password};"
sudo -u postgres  psql -c "GRANT ALL PRIVILEGES ON DATABASE zabbix to zabbix;"
gunzip --stdout /usr/share/zabbix-server-pgsql/schema.sql.gz | psql -h localhost -U zabbix -d zabbix -W
gunzip --stdout /usr/share/zabbix-server-pgsql/images.sql.gz | psql -h localhost -U zabbix -d zabbix -W 
  gunzip --stdout /usr/share/zabbix-server-pgsql/data.sql.gz | psql -h localhost -U zabbix -d zabbix -W
fi

if YESNO "modify /etc/zabbix/zabbix_server.conf?"
then
echo "
#NodeID=0
ListenPort=10051
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=$1
FpingLocation=/usr/bin/fping
" >> /etc/zabbix/zabbix_server.conf
vim -c ":9999" /etc/zabbix/zabbix_server.conf
/usr/sbin/zabbix_server -c /etc/zabbix/zabbix_server.conf
fi

ln -s /usr/share/zabbix /var/www/html

if YESNO "modify /etc/php5/apache2/php.ini?"
then
echo "
max_execution_time = 300
memory_limit = 128M
post_max_size = 16M
upload_max_filesize = 2M
max_input_time = 300
date.timezone = Europe/Zurich
" >> /etc/php5/apache2/php.ini
fi

if YESNO "modify /etc/php/7.0/apache2/php.ini?"
then
echo "
max_execution_time = 300
memory_limit = 128M
post_max_size = 16M
upload_max_filesize = 2M
max_input_time = 300
date.timezone = Europe/Zurich
" >> /etc/php/7.0/apache2/php.ini
fi

/usr/sbin/a2enmod php

/usr/sbin/apache2ctl restart

ShowAndExecute "chmod o+w /etc/zabbix"

ifconfig |grep inet |grep netmask

read -p "
Press [Enter] after doing zabbix frontend installation on http://<Server IP>/zabbix/"

ShowAndExecute "chmod o-w /etc/zabbix"


if YESNO "install zabbix agent?"
then
ShowAndExecute "apt-get -y install zabbix-agent"
ShowAndExecute "vim /etc/zabbix/zabbix_agentd.conf"
ShowAndExecute "/etc/init.d/zabbix-agent restart"
fi

if YESNO "edit snmpd.conf?"
then
vim /etc/default/zabbix-server
vim /etc/default/snmpd
vim /etc/snmp/snmpd.conf
fi

ShowAndExecute "apt-get autoremove"


