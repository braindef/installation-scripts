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

# Color Definitions
#==============================================================================
red="\e[91m"
default="\e[39m"
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
if [ "$1" = "" ]
then
echo -e "
Usage:
------
Textfile to count the word occurances. Eg.${red} ${0} CreepyPasta.txt${default}"
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




#==============================================================================
# v v v v v v v v v v v  v Script starts here v v v v v v v v v v v v v v v 
#==============================================================================
#echo -e "${red}${0} ${@}${default}"
#cat $1 | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr -d '[0-9]' | sort | uniq -c | sort -n | tee $1.$(date +%y%m%d%H%M).count | tail -n 100

rm *.all

for i in $(seq 1999 1 2017)
do
	for j in $(echo januar Januar februar Februar maerz Maerz april April mai Mai juni Juni juli Juli august August september September oktober Oktober november November dezember Dezember) 
	do
		echo $i ---- $j >> count.all
		find $i/$j -name '*.txt' |grep -v sum |grep -v chromium >files.$i.$j.all
		IFS=$'\n'
		for f in $(cat files.$i.$j.all)
		do
			echo "****** $f" >>words.$i.$j.all
			cat $f >>words.$i.$j.all
		done
		IFS=" "
		cat words.$i.$j.all | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr -d '[0-9]' | sort | uniq -c | sort -n | tee $1.$(date +%y%m%d%H%M).count |egrep -v "$(cat fuellwoerter.txt)" | tail -n 20 >>count.all
	IFS=" "
	echo ******** $i $j ********
	#cat count.$i.$j.all
	
	done
done

