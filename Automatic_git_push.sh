#!/bin/bash


# Making a shell script to commit on github

status =$(git status | awk '/Untracked/{print $1}')
add= $(git add .)
commit=$(git commit -m "Adding new file ")
change=$(git status | awk '/Changes/{print $1}')

if [[ $status -eq "Untracked" ]] || [[ $change -eq "Changes" ]]
then 
	echo "Untracked files"
	$add
        $commit
else
	exit 1

fi
