#!/bin/bash

va1=$(sysctl kernel.randomize_va_space)
va2=$(grep "kernel\.randomize_va_space" /etc/sysctl.conf /etc/sysctl.d/*)

if [[ $va1 != *"kernel.randomize_va_space = 2"* ]] || [[ $va2 != *"kernel.randomize_va_space = 2"* ]]
then
	exit 1
fi
