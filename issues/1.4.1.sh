#!/bin/bash

test=$(rpm -q aide)

if [[ $test == *"is not installed"* ]]
then
	exit 1
fi
