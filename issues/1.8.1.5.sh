#!/bin/bash

test=$(stat -L -c "%a %u %g" /etc/issue)
if [[ $test != "644 0 0" ]]
then
	exit 1
fi
