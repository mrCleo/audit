#!/bin/bash

test=$(mount | grep -E '\s/dev/shm\s' 2> /dev/null | tail -1)
if [[ "$test" != *"nodev"* ]]
then
	exit 1
fi
