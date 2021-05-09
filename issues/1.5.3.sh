#!/bin/bash

test1=$(grep /systemd-sulogin-shell /usr/lib/systemd/system/rescue.service)
test2=$(grep /systemd-sulogin-shell /usr/lib/systemd/system/emergency.service)
rescue="ExecStart=-/usr/lib/systemd/systemd-sulogin-shell rescue"
emergency="ExecStart=-/usr/lib/systemd/systemd-sulogin-shell emergency"

if [[ $test1 != $rescue ]] && [[ $test2 != $emergency ]]
then
	exit 1
fi

