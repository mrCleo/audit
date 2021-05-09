#!/bin/bash

test=$(modprobe -n -v usb-storage)
if [[ "$test" != *"install /bin/true"* ]]
then
	exit 1
fi

