#!/bin/bash


# Monitoring free RAM space


space=$(free -mt | awk '/Total/{print $4}')
th=10000
if [[ $space -lt  $th ]] 
then 
	echo "RAM is filling up fast Kindly manage $space"
else
	echo "You have enough RAM left to utilize $space"
fi

