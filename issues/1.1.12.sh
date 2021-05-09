#!/bin/bash

test=$(mount | grep -E '\s/var/log/audit\s' 2> /dev/null | tail -1)
if [[ "$test" != *"/var/log/audit"* ]]
then
	exit 1
fi
