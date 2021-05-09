#!/bin/bash

test=$(rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} -->%{summary}\n')
if [[ -z "$test" ]]
then
	exit 1
fi
