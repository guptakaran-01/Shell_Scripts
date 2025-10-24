#!/bin/bash


# Monitoring disk space 

fu=$(df -H | awk '/drivers/{print $5}' | tr -d %)
to="anshuk1145@gmail.com"

if [[ $fu -gt 20 ]]
then
	echo "Warning , disk is low " | mail -s "DISK ALERT FROM UBUNTU" $to
else
	echo "Good to go"
fi

