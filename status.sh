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
displayDate() {
	echo -e "\n${WHITE}Current Date: " `date +%D`
	echo "Current Time: " `date +%r`
	echo " "
}

diskUsage() {
	echo -e "\n${WHITE}Disk Usage: ${NOCOLOUR}" 
	df -h
}

localEnvironment() {
	echo -e "\n${WHITE}Local Environments are: ${NOCOLOUR}" 
	printenv 
}

processStatus() {
	echo "Enter Process ID: " 
	ps -e | more
}

status() {
	local choice
	while [ "$choice" != "5" ]; do
	echo -e "\n\t\t${RED} SYSTEM STATUS COMMANDS"
	echo -e "${YELLOW} 1 -- Display the current date and time"
	echo -e "${YELLOW} 2 -- Current disk usage"
	echo -e "${YELLOW} 3 -- List current local and environmental"
	echo -e "${YELLOW} 4 -- Display process status information${NOCOLOUR}"
	
	if [ "$MODE" == "novoice" ]; then
			echo -e "${YELLOW} 5 -- Quit -- Return to Main Menu\n${NOCOLOUR}"; fi
	if [ "$MODE" == "expert" ]; then
			echo -e "${YELLOW} 5 -- Exit Program\n${NOCOLOUR}"; fi
	
	echo -en "\n\t\tEnter Your Choice: "
	read choice
	case $choice in
	1)
		displayDate
		;;
	2)
		diskUsage
		;;
	3)
		localEnvironment
		;;
	4)
		processStatus
		;;
	5) 	
		if [ $MODE == "novoice" ]; then
			echo -e "${PURPLE}Directing to main menu... \n${NOCOLOUR}"; fi
		if [ $MODE == "expert" ]; then
			echo -e "${PURPLE}Quitting Program! \n${NOCOLOUR}"
			exit 0; fi
		;;
	*)	
		echo -e "${BLUE} Invalid Option \n${NOCOLOUR}"
		;;
	esac
	done
}

status
