#!/bin/bash

aideservice1=$(systemctl is-enabled aidecheck.service 2>/dev/null)
aideservice2=$(systemctl status aidecheck.service 2>/dev/null)

aidetimer1=$(systemctl is-enabled aidecheck.timer 2>/dev/null)
aidetimer2=$(systemctl status aidecheck.timer 2>/dev/null)

aide1=0
aide2=0

if [[ $aideservice1 != *"enabled"* ]] || [[ $aideservice2 != *"active (running)"* ]]
then
	aide1=1
fi

if [[ $aidetimer1 != *"enabled"* ]] || [[ $aidetimer2 != *"actice (running)"* ]]
then
	aide2=1
fi

if [[ $aide1 != 0 ]] || [[ $aide2 != 0 ]]
then
	exit 1
fi


