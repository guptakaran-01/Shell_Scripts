#!/bin/bash


# Making a shell script to commit on github

statuss=$(git status | awk '/Untracked/{print $1}')
change=$(git status | awk '/Changes/{print $1}')

if [[ $statuss -eq "Untracked" ]] || [[ $change -eq "Changes" ]]
then 
	echo "Untracked files"
	$(git add .)
        $(git commit -m "Adding new file ")
else
	exit 1

fi
