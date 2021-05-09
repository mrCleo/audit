#!/bin/bash

test=$(mount -l -t ext,vfat,iso9660)

if [[ -n $test ]]
then
	if [[ "$test" == *"nodev"* ]]
	then
		exit 1
	fi
fi
	
