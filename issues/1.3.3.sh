#!/bin/bash

test=$(grep -Ei '^\s*Defaults\s+(\[^#]+,\s*)?logfile=' /etc/sudoers /etc/sudoers.d/*)

if [[ $test != *"Defaults logfile=/var/log/sudo.log"* ]]
then	
	exit 1
fi
