#!/bin/bash

test=$(grep -E '^\s*(FUTURE|FIPS)\s*(\s+#.*)?$' /etc/crypto-policies/config)

if [[ $test != *"FUTURE"* ]] && [[ $test != *"FIPS"* ]]
then
	exit 1
fi
