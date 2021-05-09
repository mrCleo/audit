#!/bin/bash

test=$(stat -L -c "%a %u %g" /etc/motd)
if [[ $test != "644 0 0" ]]
then
	exit 1
fi
