#!/bin/bash

test=$(mount | grep -E '\s/tmp\s' 2> /dev/null | tail -1)
if [[ "$test" != *"nodev"* ]]
then
	echo "hello"
	exit 1
fi
