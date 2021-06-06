#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NOCOLOUR='\033[0m'
WHITE='\033[1;37m'

if [ "$#" == 0 ]; then
	export MODE='novoice'
	clear
	while [[ $choice != 4 ]]; do
		echo -e "\n\t\t${RED}UNIX HELP MAIN MENU${NOCOLOUR}"
		echo -e "${ORANGE}1 -- File and Directory Management Commands${NOCOLOUR}"
		echo -e "${ORANGE}2 -- Text Processing Commands${NOCOLOUR}"
		echo -e "${ORANGE}3 -- System Status Commands${NOCOLOUR}"
		echo -e "${ORANGE}4 -- Exit${NOCOLOUR}"
	
		echo -en "\n\t\tYour Choice: "
		read choice
	
		if [ $choice == 1 ]; then
			./file.sh
		elif [ $choice == 2 ]; then
			./text.sh
		elif [ $choice == 3 ]; then
			./status.sh
		elif [ $choice == 4 ]; then
			echo -e "${PURPLE}Exitting the program${NOCOLOUR}\n"
		else
			echo -e "${BLUE} Inavlid Option ${NOCOLOUR}\n"
		fi
		
	done
fi
if [ "$#" -eq 1 ]; then
	export MODE='expert'
	
	if [ "$1" == "help" ]; then
		./help.sh
	elif [ "$1" == "file" ]; then
		./file.sh
	elif [ "$1" == "text" ]; then
		./text.sh
	elif [ "$1" == "status" ]; then
		./status.sh
	else
		echo -e "${BLUE} Inavlid Input ${NOCOLOUR}\n"
		
	echo -e "${PURPLE}Exitting the program${NOCOLOUR}\n"
	fi
	
fi
	
	
