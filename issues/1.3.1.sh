#!/bin/bash

test=$(rpm -q sudo)

if [[ $test == *"is not installed"* ]]
then
	exit 1
fi
