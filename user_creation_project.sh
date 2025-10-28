#!/bin/bash

#Script should execute with sudo/root access
#user should provide atleast one argument as username else guide him
#Store 1st argument as username
#In case of more than one argument , store it as account comments 
#Create password
#Create a  user 
#Check if user is succesfully created or not
#Set the password for the user
#Check if the password is succesfully set or not  
#Force password change on first login 
#Display the username , password and the host where the user was created 


#Script should execute with sudo/root access
if [[ "${UID}" -ne  0 ]]
then
	echo "Excute using root user or use sudo"
	exit 1
fi

#user should provide atleast one argument as username else guide him
if [[ "${#}" -lt 1 ]]
then
	echo "Usage : ${0}  User_Name [ Comments]"
		      exit 1
fi

#Store 1st argument as username
User_Name="${1}"


#In case of more than one argument , store it as account comments
shift
Comment="${@}"


#Create password
Password=$(date +%s%N)

#Create a  user
useradd -c "$Comment" -m  $User_Name

#Check if user is succesfully created or not
if [[ $? -ne 0 ]]
	then
		echo "The Account could not be created "
		exit 1
fi
#Set the password for the user
#echo $Password | passwd --stdin $User_Name   for redhat/Centos
echo "$User_Name:$Password" | sudo chpasswd  # for Ubuntu

#Check if the password is succesfully set or not
 if [[ $? -ne 0 ]]
          then
                  echo "Password could not be set "
                  exit 1
  fi

#Force password change on first login
passwd -e $User_Name

#Display the username , password and the host where the user was created
echo "User : $User_Name"
echo "Password : $Password"
echo "HostName : $(hostname)"



