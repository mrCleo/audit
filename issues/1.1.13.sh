#!/bin/bash

test=$(mount | grep -E '\s/home\s' 2> /dev/null | tail -1)
if [[ "$test" != *"/home"* ]]
then
	exit 1
fi
