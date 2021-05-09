#!/bin/bash

test=$(rpm -q mcstrans 2>/dev/null)

if [[ $test != *"is not installed"* ]]
then
	exit 1
fi
