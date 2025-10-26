#!/bin/bash


# Making a shell script to commit on github

statuss=$(git status | awk '/Untracked/{print $1}')
change=$(git status | awk '/Changes/{print $1}')

if [[ $statuss == "Untracked" ]] || [[ $change == "Changes" ]]
then 
	echo "Untracked files"
	git add .
	git commit -m "Automated commit $(date) "
else
	echo "Nothing to commit"
	exit 1

fi
