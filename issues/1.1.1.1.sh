#!/bin/bash

test=$(modprobe -n -v cramfs)
if [[ "$test" != *"install /bin/true"* ]]
then
	exit 1
fi

