#!/bin/bash

test=$(rpm -q libselinux)

if [[ $test == *"is not installed"* ]]
then
	exit 1
fi
