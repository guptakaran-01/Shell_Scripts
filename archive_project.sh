#!/bin/bash
#$Revision-001$
#$Sat Oct 25 13:31:41 IST 2025$


# Archiver : Files older than 10 days gets archived in Archive.gzip

#Change RUN Variable to 1 to make changes or 0 to test dry run
RUN=0

#variables
Path=/home/karan/Shell_practice
Depth=1
files=$(find $Path  -maxdepth $Depth -type f -daystart -mtime +10 )

#Check if the directorry is present or not 

if [[ ! -d $Path ]]
then
	echo "Directory doesnot exit"
	exit 1
fi

#Create Archive folder if not present 
if [[ ! -d $Path/archive ]]
then
	mkdir $Path/archive
fi

#Find the list of files older than 10 days 
for i in $files
do
	if [[  RUN -eq 1 ]]
	then 
		gzip $i || exit 1
		mv $i.gz $Path/archive || exit 1
		#making a log to echo 
		echo " [$(date)]  archiving $i --> $Path/archive"
	else
		echo "Nothing Archived"
	fi


done




