#!/bin/bash

test=$(modprobe -n -v squashfs)
if [[ "$test" != *"install /bin/true"* ]]
then
	exit 1
fi