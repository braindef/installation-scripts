#!/bin/bash

#Script Template
#==============================================================================
#title           :gentoo install scirpt
#description     :installing gentoo desktop
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
#distro=stretch
#==============================================================================


# Helper Function to show first the command that is beeing executed
#==============================================================================
function ShowAndExecute {
#show command
echo -e "${red} $1 ${default}"
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
#ShowAndExecute "cat -e /var/lib/dpkg/lock"

#ShowAndExecute "apt --fix-broken install"

#ShowAndExecute "dpkg --configure -a"

#ShowAndExecute "apt-get -y update"

#ShowAndExecute "apt-get -y upgrade"

#ShowAndExecute "apt-get -y dist-upgrade"

#ShowAndExecute "apt-get -y install sudo git vim nano"
ip link set enp1s0f0 up
ip addr add 192.168.179.165/255.255.255.0 dev enp1s0f0
ip route add default via 192.168.179.1

if YESNO "select mirror and add to /etc/portage/make.conf?"
then
mirrorselect -i -o >>/etc/portage/make.conf

mkdir /etc/portage/repos.conf
cp /usr/share/portage/repos.conf /etc/portage/gentoo.conf
echo "nameserver 8.8.8.8" >>/etc/resolv.conf
fi

emerge app-admin/sudo
emerge dev-vcs/git
emerge app-editors/vim
emerge app-editors/gedit
emerge -s nano

emerge net-analyzer/nmap
emerge net-misc/rsync

exit 0

ShowAndExecute "apt-get -y install snmp"
ShowAndExecute "apt-get -y install pkg-config "
ShowAndExecute "apt-get -y install libdbus-1-dev"
ShowAndExecute "apt-get -y install apt-file"
ShowAndExecute "apt-file update"
ShowAndExecute "apt-get -y install figlet"
ShowAndExecute "apt-get -y install tcpdump"
ShowAndExecute "apt-get -y install iptraf"
ShowAndExecute "apt-get -y install gparted"
ShowAndExecute "apt-get -y install lightdm lxde"
ShowAndExecute "apt-get -y install gdm3 gnome gnome-shell"
ShowAndExecute "apt-get -y install gconf-editor"
ShowAndExecute "gsettings set org.gnome.nautilus.preferences always-use-location-entry true"
ShowAndExecute "apt-get -y install chromium"
ShowAndExecute "apt-get -y install inkscape"
ShowAndExecute "apt-get -y install gimp"
ShowAndExecute "apt-get -y install libreoffice"
ShowAndExecute "apt-get -y install libreoffice-help-de"
ShowAndExecute "apt-get -y install libreoffice-l10n-de"
ShowAndExecute "apt-get -y install cups-pdf"
ShowAndExecute "apt-get -y install keepassx "
ShowAndExecute "apt-get -y install icedove"
ShowAndExecute "apt-get -y install vlc"
ShowAndExecute "apt-get -y install kdenlive"
ShowAndExecute "apt-get -y install screenkey"
ShowAndExecute "apt-get -y install simplescreenrecorder"
ShowAndExecute "apt-get -y install virtualbox"

ShowAndExecute "apt-get -y install posterazor"
ShowAndExecute "apt-get -y install gconf-editor"
ShowAndExecute "apt-get -y install mumble"
ShowAndExecute "apt-get -y install font-manager"
ShowAndExecute "apt-get -y install quassel "
ShowAndExecute "apt-get -y install pidgin"
ShowAndExecute "apt-get -y install checksecurity"



