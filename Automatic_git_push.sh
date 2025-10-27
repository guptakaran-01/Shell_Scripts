#!/bin/bash


# Making a shell script to commit on github

statuss=$(git status | awk '/Untracked/{print $1}')
change=$(git status | awk '/Changes/{print $1}')

if [[ $statuss == "Untracked" ]] || [[ $change == "Changes" ]]
then 
	echo "Automated push to github"
	git add .
	git commit -m "Automated commit $(date) "
	git push origin main
else
	echo "Nothing to commit"
	exit 1

fi
