#!/bin/bash

test1=$(grep -E "^\s*\*\s+hard\s+core" /etc/security/limits.conf /etc/security/limits.d/* 2>/dev/null)
test2=$(sysctl fs.suid_dumpable)
test3=$(grep "fs\.suid_dumpable" /etc/sysctl.conf /etc/sysctl.d/*)

fs1=0
fs2=0
fs3=0

if [[ $test1 != *"hard core 0"* ]]
then
	fs1=1
fi

if [[ $test2 != *"fs.suid_dumpable = 0"* ]]
then
	fs2=1
fi

if [[ $test3 != *"fs.suid_dumpable = 0"* ]]
then
	fs3=1
fi

if [[ $fs1 != 1 ]] || [[ $fs2 != 1 ]] || [[ $fs3 != 1 ]]
then
	exit 1
fi
