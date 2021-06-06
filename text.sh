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
while [[ $choice -ne 4 ]]; do
if [ $MODE == "novoice" ]
then
	echo -e "${RED}\n\t\tTEXT PROCESSING COMMANDS${NOCOLOUR}"
	echo -e "${YELLOW}1 -- Search a file for a pattern${NOCOLOUR}"
	echo -e "${YELLOW}2 -- Count lines, words, and characters in specified files${NOCOLOUR}"
	echo -e "${YELLOW}3 -- Display line diﬀerences between two files${NOCOLOUR}"
	echo -e "${YELLOW}4 -- Quit -- Return to Main Menu${NOCOLOUR}"
fi

if [ $MODE == "expert" ]
then
	echo -e "${RED}\n\t\tTEXT PROCESSING COMMANDS${NOCOLOUR}"
	echo -e "${YELLOW}1 -- Search a file for a pattern${NOCOLOUR}"
	echo -e "${YELLOW}2 -- Count lines, words, and characters in specified files${NOCOLOUR}"
	echo -e "${YELLOW}3 -- Display line diﬀerences between two files${NOCOLOUR}"
	echo -e "${YELLOW}4 -- Quit -- Exit Program${NOCOLOUR}"
fi

echo -en "${WHITE}Your Choice: "
read choice

if [ $choice -eq 1 ]
then
	echo -en "${WHITE}Enter file path: "
	read filepath
	until [ -f $filepath ]
	do
		echo -en "${PURPLE} Invalid File Path! \n${WHITE}Enter file path again: ${NOCOLOUR}"
		read filepath
	done
	echo -en "${WHITE} Enter search pattern: ${NOCOLOUR}"
	read pattern
	
	echo -e "${WHITE}\nMatching lines (NOT CASE SENSITIVE): \n${NOCOLOUR}"
	grep -i $pattern $filepath
	echo -e " \n"
fi

if [ $choice -eq 2 ]
then
	echo -en "${WHITE}Enter file path: "
	read filepath
	until [ -f $filepath ]
	do
		echo -en "${PURPLE} Invalid File Path! \n${WHITE}Enter file path again: ${NOCOLOUR}"
		read filepath
	done
	 echo -en "${WHITE}Number of lines: ${NOCOLOUR}"  
	 wc $filepath | awk '{print $1}'
	 echo -en "${WHITE}Number of words: ${NOCOLOUR}"  
	 wc $filepath | awk '{print $2}'
	echo -en "${WHITE}Number of characters: ${NOCOLOUR}"  
	wc $filepath | awk '{print $3}'
	echo -e "\n"
fi

if [ $choice -eq 3 ]
then
	echo -en "${WHITE}Enter file path: "
	read filepath
	until [ -f $filepath ]
	do
		echo -en "${PURPLE} Invalid File Path! \n${WHITE}Enter file path again: ${NOCOLOUR}"
		read filepath
	done
	echo -en "${WHITE}Enter another file path: "
	read anotherfile
	until [ -f $anotherfile ]
	do
		echo -en "${PURPLE} Invalid File Path! \n${WHITE}Enter file path again: ${NOCOLOUR}"
		read anotherfile
	done
	diff $filepath $anotherfile | more
	echo -e "\n"
fi

if [ $choice -ne 1 -a $choice -ne 2 -a $choice -ne 3 -a $choice -ne 4 ]
   then 
     printf "${BLUE}Select a valid option ! ${NOCOLOUR}\n"
     echo -ne "${WHITE} Select from above options! \n\n${NOCOLOUR} "
fi

if [ $choice -eq 4 ]
then
	if [ $MODE = "novoice" ]; then
		echo -e "${PURPLE} Directing to main menu... \n ${NOCOLOUR}"
	fi
	if [ $MODE = "expert" ]; then
		echo -e "${PURPLE} Quitting from program \n ${NOCOLOUR}"
		exit 0
	fi
fi
done
	

