#!/bin/bash


# Code to validate date provided by the user


read -p "Enter the  date in (YYYY-MM-DD OR YYYY/MM/DD)  format " date

reg='^([0-9]{4})[-/]((0[1-9]|[12][0-2]))[-/]((0[1-9]|[12][0-9]|3[01]))$'

if [[ $date =~ $reg ]] 
then
	year="${BASH_REMATCH[1]}"
	month="${BASH_REMATCH[2]}"
	day="${BASH_REMATCH[3]}"

	if [[ $month -eq "02" ]]
	then
		if (( ($year % 4 == 0 && $year % 100 != 0) || ($year % 400 ==0) )) 
		then 
		       max_day=29
	       else
	               max_day=28
	        fi
        elif [[ $month =~ ^(04|06|09|11)$ ]] 
       	then 
		max_day=30
	else
		max_day=31
	fi
	if (( 10#$day <= max_day )) 
       	then
        echo "Valid date: $date"
    else
        echo "Invalid day for the month."
    fi

else
    echo "Invalid date format."
fi 

                                            		
