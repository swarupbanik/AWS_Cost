#!/bin/bash

read -p "Enter your IAM user name: " Username
b= aws iam list-users  | grep -w "${Username}" | grep -v grep | wc -l

if [ ${b}  =  0 ]
then
	echo "${Username} is not a valid User"
	echo " Please try again with Valid User"
	exit 1
fi
 
aws iam list-groups-for-user --user-name ${Username} | awk -F group/ '{print $2}' |awk '{print $1}' ORS=" "
