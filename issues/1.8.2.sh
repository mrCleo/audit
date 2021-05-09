#!/bin/bash

test1=$(cat /etc/gdm3/greeter.dconf-defaults 2>/dev/null)


if [[ $test1 != *"banner-message-enable=true"* ]]
then
	exit 1
fi
