#!/bin/bash

test=$(grep -Ei '^\s*Defaults\s+(\[^#]+,\s*)?use_pty' /etc/sudoers /etc/sudoers.d/* 2>/dev/null)

if [[ $test != *"Defaults use_pty"* ]]
then	
	exit 1
fi
