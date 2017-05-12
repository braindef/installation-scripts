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


#Color Definitions
red="\e[91m"
default="\e[39m"

#distro=jessie
distro=stretch


#Helper Function to show first the command that is beeing executed
#-----------------------------------------------------------------
function ShowAndExecute {
echo -e "Running: ${red} $1 ${default}"
$1
}
##test if everything worked


# Helper Function for YES or NO Answers
# -------------------------------------
# Example YESNO "Question to ask" "command to be executed"
function YESNO {
echo -e -n "${red}$1 [y/N]${default} "
read -d'' -s -n1 answer
echo
if  [ "$answer" = "y" ] || [ "$answer" = "Y" ]
then
ShowAndExecute "$2"
else
echo -e "
${red}NOT runnung${default} $2
"
fi
}


#Test if script runs as root otherweise exit with exit code 1
#------------------------------------------------------------
if [[ $EUID -ne 0 ]]; then
  echo -e -n "
${red}You must be a root user to run this script${default}
at the moment you are " 2>&1
  id | cut -d " " -f1
  echo
  exit 1
fi

#Test if enough parameters given
#-------------------------------
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

echo -e "${red}${0} ${@}${default}"

ShowAndExecute "cat -e /var/lib/dpkg/lock"

ShowAndExecute "dpkg --configure -a"

ShowAndExecute "apt-get -y update"

ShowAndExecute "apt-get -y upgrade"

ShowAndExecute "apt-get -y dist-upgrade"

ShowAndExecute "apt-get -y install sudo git vim nano"

#EDITOR=$(which nano)
EDITOR=$(which vim)

YESNO "Edit /etc/apt/sources.list?" "$EDITOR /etc/apt/sources.list"


