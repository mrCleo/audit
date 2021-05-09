#!/bin/bash

test=$(grep -E '^\s*LEGACY\s*(\s+#.*)?$' /etc/crypto-policies/config)

if [[ $test == *"LEGACY"* ]]
then
	exit 1
fi
