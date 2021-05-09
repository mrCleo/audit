#!/bin/bash

test=$(grep "^\s*GRUB2_PASSWORD" /boot/grub2/user.cfg 2>/dev/null)

if [[ $test != *"GRUB2_PASSWORD="* ]]
then
	exit 1
fi
