#!/bin/bash

test=$(modprobe -n -v vfat)
if [[ "$test" != *"install /bin/true"* ]]
then
	exit 1
fi
