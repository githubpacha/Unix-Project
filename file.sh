#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NOCOLOUR='\033[0m'
WHITE='\033[1;37m'

clear
while [[ $choice -ne 6 ]]; do
if [ $MODE == "novoice" ]
then
	
	echo -e "${RED}\n\t\tFILE AND DIRECTORY MANAGEMENT COMMANDS"
	echo -e "${YELLOW}1 -- Display the contents of a file"
	echo -e "${YELLOW}2 -- Remove a file"
	echo -e "${YELLOW}3 -- Copy a file"
	echo -e "${YELLOW}4 -- List a file"
	echo -e "${YELLOW}5 -- Size of a file"
	echo -e "${YELLOW}6 -- Quit -- Return to main Menu\n${NOCOLOUR}"
fi

if [ $MODE == "expert" ]
then
	
	echo -e "${RED}\n\t\tFILE AND DIRECTORY MANAGEMENT COMMANDS"
	echo -e "${YELLOW}1 -- Display the contents of a file"
	echo -e "${YELLOW}2 -- Remove a file"
	echo -e "${YELLOW}3 -- Copy a file"
	echo -e "${YELLOW}4 -- List a file"
	echo -e "${YELLOW}5 -- Size of a file"
	echo -e "${YELLOW}6 -- Exit Program;\n${NOCOLOUR}"
fi

echo -en "${WHITE}Your Choice: "
read choice

if [ $choice == 1 ]
then
	echo -en "${WHITE}Enter File path: "
	read filepath
	for f in $filepath
	do
		if [ ! -f $f ]
		then
			echo -en "${BLUE} Invalid File! \n${NOCOLOUR}"
		else
			echo -e "\n${WHITE}Content of the file: ${NOCOLOUR}\n"
			cat $f | more
		fi
		
	done
	echo  -e " ${NOCOLOUR}\n"
fi

if [ $choice == 2 ]
then
	echo -en "${WHITE}Enter File path: "
	read filepath
	for f in $filepath
	do
		if [ ! -f $f ]
		then
			echo -en "\n${BLUE} Invalid File! \n${NOCOLOUR}"
		else
			rm $f
			echo -e "\n${PURPLE} File Removed. \n${NOCOLOUR}"
		fi
	done
	echo  -e " ${NOCOLOUR}\n"
fi

if [ $choice == 3 ]
then
	echo -en "${WHITE}Enter File path: "
	read filepath
	while [ ! -f $filepath ]
	do
		echo -en "${BLUE} Invalid File Path! \n${WHITE}Enter again: ${NOCOLOUR}"
		read filepath
	done
	echo -en "${WHITE}Enter Destination path: "
	read destiny
	while [ ! -d $destiny ]
	do
		echo -en "${BLUE} Invalid directory Path! \n${WHITE}Enter again: ${NOCOLOUR}"
		read destiny
	done
	cp $filepath $destiny
	echo -e "${PURPLE} File Copied! \n${NOCOLOUR}"
fi

if [ $choice == 4 ]
then
	echo -en "${WHITE}Enter File path: "
	read filepath
	ls -l $filepath
	echo  -e " ${NOCOLOUR}\n"
fi

if [ $choice == 5 ]
then
	echo -en "${WHITE}Enter File path: "
	read filepath
	for f in $filepath
	do
		if [ ! -f $f ]
		then
			echo -en "${BLUE} Invalid File! \n${NOCOLOUR}"
		else
			if [ -f $f ]; then
				echo -en "\n${WHITE} Size of the file: "
				ls -lh $f | awk '{print $5}'
			fi
		fi
	done
	echo  -e " ${NOCOLOUR}\n"
fi

if [ $choice == 6 ]
then
	if [ $MODE == "novoice" ]
	then
		echo -e "\n${PURPLE}Quitting to main menu...${NOCOLOUR}\n"
	fi
	if [ $MODE == "expert" ]
	then
		echo -e "\n${PURPLE}Exitting the program...${NOCOLOUR}\n"
		exit 0
	fi
fi
if [ $choice -ne 1 -a $choice -ne 2 -a $choice -ne 3 -a $choice -ne 4 -a $choice -ne 5 -a $choice -ne 6 ]
   then 
     printf "${BLUE}Select a valid option ! ${NOCOLOUR}\n"
     echo -ne "${WHITE} Select from above! \n\n${NOCOLOUR} "
fi
done

