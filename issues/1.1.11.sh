#!/bin/bash

test=$(mount | grep -E '\s/var/log\s' 2> /dev/null | tail -1)
if [[ "$test" != *"/var/log"* ]]
then
	exit 1
fi
