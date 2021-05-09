#!/bin/bash

test=$(grep -E 'kernelopts=(\S+\s+)*(selinux=0|enforcing=0)+\b' /boot/grub2/grubenv)

if [[ $test == *"selinux=0"* ]] || [[ $test == *"enforcing=0"* ]]
then
	exit 1
fi
