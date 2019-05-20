#!/bin/bash

#Script Template
#==============================================================================
#title           :
#description     :
#author		 :Marc Landolt, @FailDef
#date            :
#version         :0.1
#usage		 :
#notes           :
#bash_version    :
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
distro=buster
#==============================================================================

# Define ipv4 for Apt
ip="-o Acquire::ForceIPv4=true"

# Helper Function to show first the command that is beeing executed
#==============================================================================
function ShowAndExecute {
#show command
echo ================================================================================
echo -e "${red} $1 ${default}"
echo --------------------------------------------------------------------------------
#execute command
sudo $1
#test if it worked or give an ERROR Message in red, return code of apt is stored in $?
rc=$?;
if [[ $rc != 0 ]]
  then
	  echo -e ${red}ERROR${default} $rc
	  echo $1 >>fail.txt
fi
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
#if [[ $EUID -ne 0 ]]; then
#  echo -e -n "
#${red}You must be a root user to run this script${default}
#at the moment you are " 2>&1
#  id | cut -d " " -f1
#  echo
#  exit 1
#fi
#==============================================================================


# Test if user has given enough parameters
#==============================================================================
if "$1" = ""
then
echo -e "
Usage:
------
Enter the (new) Database Password as parameter ${red}sudo ${0} 123456${default} "
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

ShowAndExecute "apt --fix-broken $ip install"

ShowAndExecute "dpkg --configure -a"

ShowAndExecute "apt-get -y $ip update"

ShowAndExecute "apt-get -y $ip upgrade"

ShowAndExecute "apt-get -y $ip dist-upgrade"

ShowAndExecute "apt-get -y $ip install sudo git vim nano"
#==============================================================================

# edit repository list
#==============================================================================
if YESNO "Edit /etc/apt/sources.list?"
then
ShowAndExecute "$EDITOR /etc/apt/sources.list"
fi

if YESNO "Use TOR (The Onion Router) for APT Transport?"
then

  ShowAndExecute "apt-get -y $ip install torsocks apt-transport-tor"

  cp /etc/apt/sources.list /etc/apt/sources.list-$(date +%Y%m%d-%H%M%S.bak)
  echo "
deb tor+http://vwakviie2ienjx6t.onion/debian/ $codename main contrib
deb tor+http://earthqfvaeuv5bla.onion/debian/ $codename main contrib
" > /etc/apt/sources.list

ShowAndExecute "apt-get -y update"

ShowAndExecute "apt-get -y upgrade"

ShowAndExecute "apt-get -y $ip install tor tor-arm"
fi

if YESNO "Use normal httpredir.debian.org for APT Transport?"
then
  cp /etc/apt/sources.list /etc/apt/sources.list-$(date +%Y%m%d-%H%M%S.bak)
  echo "
deb http://httpredir.debian.org/debian/ $distro main contrib
deb-src http://httpredir.debian.org/debian/ $distro main contrib

deb http://security.debian.org/ $distro/updates main contrib
deb-src http://security.debian.org/ $distro/updates main contrib

deb http://httpredir.debian.org/debian/ $distro-updates main contrib
deb-src http://httpredir.debian.org/debian/ $distro-updates main contrib
" >/etc/apt/sources.list

fi

# edit repository list after modification
#==============================================================================
if YESNO "Edit /etc/apt/sources.list?"
then
ShowAndExecute "$EDITOR /etc/apt/sources.list"

ShowAndExecute "apt-get -y update"

ShowAndExecute "apt-get -y upgrade"
fi

# edit repository list after modification
#==============================================================================

ShowAndExecute "apt-get -y $ip install keepassx"
ShowAndExecute "apt-get -y $ip install build-essential linux-headers-$(uname -r)"
ShowAndExecute "apt-get -y $ip install md5deep"
ShowAndExecute "apt-get -y $ip install rdfind"
ShowAndExecute "apt-get -y $ip install xdg-utils"
ShowAndExecute "apt-get -y $ip install nmap"
ShowAndExecute "apt-get -y $ip install rsync"
ShowAndExecute "apt-get -y $ip install snmp"
ShowAndExecute "apt-get -y $ip install jigdo-file"
ShowAndExecute "apt-get -y $ip install build-essential"
ShowAndExecute "apt-get -y $ip install pkg-config "
ShowAndExecute "apt-get -y $ip install libdbus-1-dev"
ShowAndExecute "apt-get -y $ip install apt-file"
ShowAndExecute "apt-file update"
ShowAndExecute "apt-get -y $ip install figlet"
ShowAndExecute "apt-get -y $ip install git"
ShowAndExecute "apt-get -y $ip install tcpdump"
ShowAndExecute "apt-get -y $ip install iptraf"
ShowAndExecute "apt-get -y $ip install gparted"
ShowAndExecute "apt-get -y $ip install lightdm lxde"
ShowAndExecute "apt-get -y $ip install gdm3 gnome gnome-shell"
ShowAndExecute "apt-get -y $ip install gconf-editor"
ShowAndExecute "gsettings set org.gnome.nautilus.preferences always-use-location-entry true"
ShowAndExecute "apt-get -y $ip install chromium"
ShowAndExecute "apt-get -y $ip install chromium-browser"
ShowAndExecute "apt-get -y $ip install inkscape"
ShowAndExecute "apt-get -y $ip install gimp"
ShowAndExecute "apt-get -y $ip install libreoffice"
ShowAndExecute "apt-get -y $ip install libreoffice-help-de"
ShowAndExecute "apt-get -y $ip install libreoffice-l10n-de"
ShowAndExecute "apt-get -y $ip install cups-pdf"
ShowAndExecute "apt-get -y $ip install icedove"
ShowAndExecute "apt-get -y $ip install thunderbird"
ShowAndExecute "apt-get -y $ip install vlc"
#video Editing
ShowAndExecute "apt-get -y $ip install kdenlive"
#display typed keys
ShowAndExecute "apt-get -y $ip install screenkey"

ShowAndExecute "apt-get -y $ip install simplescreenrecorder"
#ShowAndExecute "apt-get -y $ip install virtualbox"

#music software
ShowAndExecute "apt-get -y $ip install audacity"
ShowAndExecute "apt-get -y $ip install lmms"

ShowAndExecute "apt-get -y $ip install posterazor"
ShowAndExecute "apt-get -y $ip install gconf-editor"
ShowAndExecute "apt-get -y $ip install mumble"
ShowAndExecute "apt-get -y $ip install font-manager"
ShowAndExecute "apt-get -y $ip install quassel "
ShowAndExecute "apt-get -y $ip install pidgin"
ShowAndExecute "apt-get -y $ip install checksecurity"
ShowAndExecute "apt-get -y $ip install spyder"
ShowAndExecute "apt-get -y $ip install spyder3"

#kali like environment
ShowAndExecute "apt-get -y $ip install forensics-all"

#streaming software
ShowAndExecute "apt-get -y $ip install obs-studio"

#Network Discovery
ShowAndExecute "apt-get $ip install arp-scan"
for i in $(echo 0 1 2 179 180 192)
do
  echo -e ${red}scanning 192.168.$i.0/24${default}
  echo ========================
  sudo arp-scan 192.168.$i.0/24 #--interface enp1s0f1 
done

ShowAndExecute "apt-get autoremove"

#always show the complete path in nautilus
ShowAndExecute "sudo -u $(logname) gsettings set org.gnome.nautilus.preferences always-use-location-entry true"
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

#change theme of ubuntu to more debian like theme
sudo update-alternatives --config gdm3.css

sudo apt remove gnome-shell-extension-ubuntu-dock

gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 0

#firefox https://extensions.gnome.org/extension/517/caffeine/
#firefox https://extensions.gnome.org/extension/826/suspend-button/

sudo apt-get $ip install gnome-shell-extension-caffeine
sudo apt-get $ip install gnome-shell-extension-suspend-button

sudo -u $(logname) firefox https://extensions.gnome.org/extension/755/hibernate-status-button/
sudo -u $(logname) firefox https://extensions.gnome.org/extension/945/cpu-power-manager/

sudo -H -u marc bash -c '/usr/bin/keepassx'

