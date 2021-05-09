#!/bin/bash

test=$(mount | grep -E '\s/tmp\s' 2> /dev/null | tail -1)
if [[ "$test" != *"noexec"* ]]
then
	exit 1
fi
