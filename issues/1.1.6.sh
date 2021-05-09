#!/bin/bash

test=$(mount | grep -E '\s/var\s' 2> /dev/null | tail -1)
if [[ "$test" != *"/var"* ]]
then
	exit 1
fi
