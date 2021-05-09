#!/bin/bash

status1=$(grep -E '^\s*SELINUX=enforcing' /etc/selinux/config)
status2=$(sestatus)

res1=0
res2=0
stat1=0
stat2=0
stat3=0

if [[ $status1 != *"SELINUX=enforcing"* ]]
then
	res1=1
fi

sestatus | sed 's/ //g' | while read -r line; do
	if [[ $line == *"SELinuxstatus:enabled"* ]]
	then
		stat1=1
	fi

	if [[ $line == *"Currentmode:enforcing"* ]]
	then
		stat2=1
	fi
	if [[ $line == *"Modefromconfigfile:enforcing"* ]]
	then
		stat3=1
	fi
done

if [[ $stat1 != 1 ]] || [[ $stat2 != 1 ]] || [[ $stat3 != 1 ]]
then
	res2=1
fi

if [[ $res1 == 1 ]] || [[ $res2 == 1 ]]
then
	exit 1
fi
