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
echo -e -n "Running: ${red} $1 ${default}"
$1
}

#Test if script runs as root
#---------------------------
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
if  [ "$3" = "" ]; then
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


ShowAndExecute "ls -la" $1



