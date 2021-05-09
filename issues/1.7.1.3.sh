#!/bin/bash

policy1=$(grep -E '^\s*SELINUXTYPE=(targeted|mls)\b' /etc/selinux/config)
policy2=$(sestatus | grep Loaded)
res1=0
res2=0

if [[ $policy1 != *"targeted"* ]] && [[ $policy1 != *"mls"* ]]
then
	res1=1
fi

if [[ $policy2 != *"targeted"* ]] && [[ $policy2 != *"mls"* ]]
then
	res2=1
fi

if [[ $res1 == 1 ]] || [[ $res2 == 1 ]]
then
	exit 1
fi
