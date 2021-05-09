#!/bin/bash

test=$(ps -eZ | grep unconfined_service_t 2>/dev/null | sed 's/ //g')

if [[ $test == "" ]]
then
	exit 1
fi
