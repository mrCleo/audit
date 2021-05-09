#!/bin/bash

grepaudit1=0
grepaudit2=0
test=$(grep ^gpgcheck /etc/yum.conf)

if [[ $test != *"gpgcheck=1"* ]]
then
	grepaudit1=1
fi

grep ^gpgcheck /etc/yum.repos.d/* | while read -r line; do
	if [[ $line != *"gpgcheck=1"* ]]
	then
		grepaudit2=1
	fi
done

if [[ $grepaudit1 != "0" ]] || [[ $grepaudit2 != "0" ]]
then
	exit 1
fi

