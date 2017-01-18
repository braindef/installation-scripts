#!/bin/bash

#Zusammengeklaut von Marc Landolt jr
#==============================================================================
#title           :tor-with-ooniprobe-install.sh
#description     :This scirpt installs Tor and ooniprobe (Switzerland)
#author		 :Marc Landolt, @FailDef
#date            :20151212
#version         :0.2
#usage		 :bash tor-with-ooniprobe-install.sh
#notes           :
#bash_version    :4.3.30(1)-release
#==============================================================================

clear

#ein paar Leerzeilen anzeigen
for i in 1 2 3 4 5
  do echo " "
done


echo -e "
\e[36mAledged: die Leute die #ooniprobe aktiv verwenden werden von einem Agenten überwacht, aus erstem erfolgreichein Installieren wird
wird ein CogScience Virus geschrieben um andere beim Installieren auf falschen Pfad zu schicken und zu triggern => Aversion #tor #ooniprobe
so soll z.B. in der #Schweiz geheim bleiben dass die Überwachungsinfrastruktur eine #Zensur Infrastruktur ist #tor #ooniprobe
Pfad, z.B. die Webseiten wo man Fehlermeldungen nachliest wird vom CIA/NSA mit CogScience Malware/Sprengfallen (ev personifiziert) infiziert

für's Triggern mutmasslich Quantum/Resesarch/Group::TURBINE::qFire mit pulsed microwave verwendet der Epilepsieanfall verursachen
\e[39m

allenfalls /Kind/ dass auf dem Epilepsie schrott noch nicht angegriffen wird oder gleichaltriges /Kind/ / Ageplay Papi der resistent gegen den qFire mist kann helfen 
"


echo -e "Falls keine Debian CD vorhanden, bitte die Zeile mit \"deb cdrom....\" mit \"#deb cdrom....\" im \e[1m/etc/apt/sources.list\e[0m auskommentieren"
echo -e "mit der kombination  \e[36m[esc]i\e[39m schreibt man mit \e[36m[esc]:wq\e[39m speichert und beendet man"
echo " "
read -p "Bitte Taste drücken um die /etc/apt/sources.list zu editieren"

vi /etc/apt/sources.list

apt-get update

apt-get dist-upgrade

apt-get upgrade

apt-get install sudo vim git

git clone https://github.com/braindef/installation-scripts


echo -e "Modify udev \e[31m/etc/network/interfaces\e[0m file auotmatically (y/n)"
read input
if echo "$input" | grep -iq "^y"
then

 echo "

#Beispiel Konfiguration für 2 Netzwerkkarten /etc/network/interfaces
#-------------------------------------------------------------------
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
#source /etc/network/interfaces.d/*
#
# The loopback network interface
#auto lo
#iface lo inet loopback

# The primary network interface (WAN)
#auto eth0
#allow-hotplug eth0
#iface eth0 inet dhcp
#iface eth0 inet static
#  address 192.168.179.4
#  netmask 255.255.255.0
#  post-up route add -net 192.168.178.0/24 gw 192.168.179.1
# # absichtlch kein Gateway
#
#
# The secondary network interface (LAN)
#auto eth0
#allow-hotplug eth1
#iface eth1 inet dhcp
#iface eth1 inet static
#  address 192.168.179.3
#  netmask 255.255.255.0
#  post-up route add -net 192.168.178.0/24 gw 192.168.179.1
#
#
# The tertiary network interface (WLAN) 
#auto wlan0
#allow-hotplug wlan0
#iface wlan0 inet dhcp
# wireless-essid FREIfunkRombachtaeli
# wireless-mode managed
#iface wlan0 inet static
#  address 192.168.179.4
#  netmask 255.255.255.0
#  post-up route add -net 192.168.178.0/24 gw 192.168.179.1
" | tee -a /etc/network/interfaces

fi


echo -e "Modify \e[31m/etc/udev/rules.d/70-persistent-net.rules\e[0m file auotmatically (y/n)"
read input
if echo "$input" | grep -iq "^y"
then
ifconfig -a |grep ether |cut -d " "  -f10 >> /etc/udev/rules.d/70-persistent-net.rules
fi

sudo vim /etc/udev/rules.d/70-persistent-net.rules
sudo vim /etc/network/interfaces

sudo ifdown eth0
sudo ifdown eth1
sudo ifdown wlan0
sudo ifup eth0
sudo ifup eth1
sudo ifup wlan0


echo "Testen ob das Route zum Monitoring Server funktioniert: ping 192.168.179.222 -c3
"
ping 192.168.179.166 -c3

read -p "Bitte Taste drücken"

echo "
sudo apt-get install tor tor-arm vim figlet
"
sudo apt-get install tor tor-arm vim figlet

echo -e "\e[32m"
/usr/bin/figlet -w 180 tor und ooniprobe installieren
echo auf Debian stretch
echo -e "\e[0m
die beiden Ports 9030 (DirPort) und 9001 (ORPort) müssen im Portforwarding des Routers freigeschaltet sein oder das Gerät muss direkt am Netz hängen ohne Ruter dazwischen


Google Bildersuche: Port-Forwarding <Gerätetyp>
               z.B. Port-Forwarding zyxel USG100

\e[33m/etc/tor/torrc\e[39m
Bei den Zeilen \e[36mDirPort\e[39m und \e[36mORPort\e[39m den trailing hash (das # ganz am Anfang) löschen
Mit \e[36m[esc]i\e[39m schreibt man in die Datei mit \e[36m[esc]:wq\e[39m speichert man (Write) und schliesst (Quit) die Datei

"

echo -e "Datei \e[1m/etc/tor/torrc\e[0m zu editieren (y/n)"
read input
if echo "$input" | grep -iq "^y"
then
 sudo vim /etc/tor/torrc
fi


echo "Tor restarten: \"/etc/init.d/tor restart\""
sudo /etc/init.d/tor restart
sudo /etc/init.d/tor status

tail -n 20 /var/log/tor/log


echo "
Zabbix Agent installieren: apt-get install zabbix-agent
"
sudo apt-get install zabbix-agent
echo "
im \e[1m/etc/zabbix/zabbix_agentd.conf\e[0m bei der Zeile \"\e[1mserver=192.168.179.222\e[0m\" den oder die zabbix Server eintragen (Es hat Kommentare im Konfig File)
"
read -p "Bitte Taste drücken"
vim /etc/zabbix/zabbix_agentd.conf

echo "Zabbix neu starten: \"/etc/init.d/zabbix_agentd restart\""
/etc/init.d/zabbix_agentd restart
/etc/init.d/zabbix_agentd status

apt-get install snmpd snmp
echo -e "\e[36mAnpassungen in snmpd.conf\e[39m
--------------------------

\e[1magentAddress 192.168.x.x:161\e[0m


das ist die Netzwerkkarte im internen Netzwerk wo mein Monitoring läuft

\e[1mrocommunity public localhost\e[0m
\e[1mrocommunity public 192.168.1.0/24\e[0m
\e[1mrocommunity public 192.168.179.0/24\e[0m
das sind die die da zugreifen können, security mässig bisschen viel, und man könnte auch noch passworte setzen, aber ist halt quick&dirthy
"

read -p "Bitte Taste drücken"


vim /etc/snmp/snmpd.conf
/etc/init.d/snmpd restart
/etc/init.d/snmpd status


/usr/bin/snmpwalk -v2c -cpublic 192.168.179.1 iso.3.6.1.2.1.1
/usr/bin/snmpwalk -v2c -cpublic 192.168.179.2 iso.3.6.1.2.1.1
/usr/bin/snmpwalk -v2c -cpublic 192.168.179.3 iso.3.6.1.2.1.1
/usr/bin/snmpwalk -v2c -cpublic 192.168.179.4 iso.3.6.1.2.1.1


echo -e "\e[1mtor-ooniprobe\e[0m installieren (y/n)"
read input
if echo "$input" | grep -iq "^y"
then
 ./ooni-stretch.sh
fi

