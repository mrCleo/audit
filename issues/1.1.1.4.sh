#!/bin/bash

test=$(modprobe -n -v udf)
if [[ "$test" != *"install /bin/true"* ]]
then
	exit 1
fi