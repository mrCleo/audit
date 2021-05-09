#!/bin/bash

test=$(systemctl show -p ActiveState autofs)
if [[ "$test" == *"disabled"* ]] || [[ "$test" != *"ActiveState=inactive"* ]]
then	
	exit 1
fi
