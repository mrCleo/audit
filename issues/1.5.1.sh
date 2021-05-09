#!/bin/bash

test=$(stat -L -c "%a %u %g" /boot/grub2/grub.cfg)

if [[ $test != "600 0 0" ]]
then
	exit 1
fi
