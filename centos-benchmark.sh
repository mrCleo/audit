#!/bin/bash

#Total issues for Initial Setup section of CIS Benchmark
total_marks_initial=0

#Total issues for Services section of CIS Benchmark
total_marks_services=0

#Total issues for Network Configuration section of CIS Benchmark
total_marks_network=0

#Total issues for Logging and Auditing section of CIS Benchmark
total_marks_logging=0

#Total issues for Access, Authentication and Authorization section of CIS Benchmark
total_marks_access=0

#Total issues for System Maintenance section of CIS Benchmark
total_marks_system=0

#Auditing score for Initial Setup section of CIS Benchmark
marks_initial_score=0

#Auditing score issues for Services section of CIS Benchmark
marks_services_score=0

#Auditing score for Network Configuration section of CIS Benchmark
marks_network_score=0

#Auditing score for Logging and Auditing section of CIS Benchmark
marks_logging_score=0

#Auditing score for Access, Authentication and Authorization section of CIS Benchmark
marks_access_score=0

#Auditing score for System Maintenance section of CIS Benchmark
marks_system_score=0

#Timestamp for creation of output file
audit_time="audit_$(date +"%Y_%m_%d_%I_%M_%p")"

#Main function for auditing and scoring.

run_audit () {

	issue=$1
	desc=$2
	mark=$3
	pass=0
	manualpass=$4

	#Determine which section the issue is located within the benchmark, 1 to 6, the function is called upon to audit
	#and tally total possible marks
	if [[ $mark == marked1 ]];
		then
		((total_marks_initial+=1))
	fi

	if [[ $mark == marked2 ]];
		then
		((total_marks_services+=1))
	fi

	if [[ $mark == marked3 ]];
		then
		((total_marks_network+=1))
	fi

	if [[ $mark == marked4 ]];
		then
		((total_marks_logging+=1))
	fi

	if [[ $mark == marked5 ]];
		then
		((total_marks_access+=1))
	fi

	if [[ $mark == marked6 ]];
		then
		((total_marks_system+=1))
	fi
	
	#If the $issue.sh run does not return an exit code of 1, the relevant issue should be tagged as having PASS, else FAIL, if there is no relevant .sh, SKIPPED/UNAVAILABLE
	if [[ -f issues/$issue.sh ]]
		then
		sh ./issues/$issue.sh > /dev/null 2>/dev/null
		if [[ "$?" -ne 0 ]]
		then	
			pass="FAIL"
		else
			pass="PASS"
			
			#Add a +1 score for compliance to an issue of the benchmark, 
			#categorized by section
			if [[ $mark == marked1 ]];
				then
				((marks_initial_score+=1))
			fi

			if [[ $mark == marked2 ]];
				then
				((marks_services_score+=1))
			fi

			if [[ $mark == marked3 ]];
				then
				((marks_network_score+=1))
			fi

			if [[ $mark == marked4 ]];
				then
				((marks_logging_score+=1))
			fi

			if [[ $mark == marked5 ]];
				then
				((marks_access_score+=1))
			fi

			if [[ $mark == marked6 ]];
				then
				((marks_system_score+=1))
			fi
		fi
	elif [[ $manualpass == 1 ]]
	then
		pass="REQUIRES MANUAL AUDITING"
	else
		pass="SKIPPED/UNAVAILABLE"		
	fi
	echo $issue";"$desc";"$pass | paste -sd "," >> "$audit_time.csv"
	echo $issue $desc $pass
}
clear
run_audit 1.1.1.1 "Ensure mounting of cramfs filesystems is disabled (Scored)" marked1
run_audit 1.1.1.2 "Ensure mounting of vFAT filesystems is limited (Not Scored)" unmarked1
run_audit 1.1.1.3 "Ensure mounting of squashfs filesystems is disabled (Scored)" marked1
run_audit 1.1.1.4 "Ensure mounting of udf filesystems is disabled (Scored)" marked1
run_audit 1.1.2 "Ensure /tmp is configured (Scored)" marked1
run_audit 1.1.3 "Ensure nodev option set on /tmp partition (Scored)" marked1
run_audit 1.1.4 "Ensure nosuid option set on /tmp partition (Scored)" marked1
run_audit 1.1.5 "Ensure noexec option set on /tmp partition (Scored)" marked1
run_audit 1.1.6 "Ensure separate partition exists for /var (Scored)" marked1
run_audit 1.1.7 "Ensure separate partition exists for /var/tmp (Scored)" marked1
run_audit 1.1.8 "Ensure nodev option set on /var/tmp partition (Scored)" marked1
run_audit 1.1.9 "Ensure nosuid option set on /var/tmp partition (Scored)" marked1
run_audit 1.1.10 "Ensure noexec option set on /var/tmp partition (Scored)" marked1
run_audit 1.1.11 "Ensure separate partition exists for /var/log (Scored)" marked1
run_audit 1.1.12 "Ensure separate partition exists for /var/log/audit (Scored)" marked1
run_audit 1.1.13 "Ensure separate partition exists for /home (Scored)" marked1
run_audit 1.1.14 "Ensure nodev option set on /home partition (Scored)" marked1
run_audit 1.1.15 "Ensure nodev option set on /dev/shm partition (Scored)" marked1
run_audit 1.1.16 "Ensure nosuid option set on /dev/shm partition (Scored)" marked1
run_audit 1.1.17 "Ensure noexec option set on /dev/shm partition (Scored)" marked1
run_audit 1.1.18 "Ensure nodev option set on removable media partitions (Not Scored)" marked1
run_audit 1.1.19 "Ensure nosuid option set on removable media partitions (Not Scored)" marked1
run_audit 1.1.20 "Ensure noexec option set on removable media partitions (Not Scored)" marked1
run_audit 1.1.21 "Ensure sticky bit is set on all world-writable directories (Scored)" marked1
run_audit 1.1.22 "Disable Automounting (Scored)" marked1
run_audit 1.1.23 "Disable USB Storage (Scored)" marked1
run_audit 1.2.1  "Ensure GPG keys are configured (Not Scored)" marked1
run_audit 1.2.2  "Ensure gpgcheck is globally activated (Scored)" marked1
run_audit 1.2.3  "Ensure package manager repositories are configured (Scored)" marked1 1 
run_audit 1.3.1 "Ensure sudo is installed (Scored)" marked1
run_audit 1.3.2 "Ensure sudo commands use pty (Scored)" marked1
run_audit 1.3.3 "Ensure sudo log files exists (Scored)" marked1
run_audit 1.4.1 "Ensure AIDE is installed (Scored)" marked1
run_audit 1.4.2 "Ensure filesystem integrity is regularly checked (Scored)" marked1
run_audit 1.5.1 "Ensure permissions on bootloader config are configured (Scored)" marked1
run_audit 1.5.2 "Ensure bootloader password is set (Scored)" marked1
run_audit 1.5.3 "Ensure authentication required for single user mode (Scored)" marked1
run_audit 1.6.1 "Ensure core dumps are restricted (Scored)" marked1
run_audit 1.6.2 "Ensure address space layout randomization (ASLR) is enabled (Scored)" marked1
run_audit 1.7.1.1 "Ensure SELinux is installed (Scored)" marked1
run_audit 1.7.1.2 "Ensure SELinux is not disabled in bootloader configuration (Scored)" marked1
run_audit 1.7.1.3 "Ensure SELinux policy is configured (Scored)" marked1
run_audit 1.7.1.4 "Ensure the SELinux state is enforcing (Scored)" marked1
run_audit 1.7.1.5 "Ensure no unconfined services exist (Scored)" marked1
run_audit 1.7.1.6 "Ensure SETroubleshoot is not installed (Scored)" marked1
run_audit 1.7.1.7 "Ensure the MCS Translation Service (mcstrans) is not installed (Scored)" marked1
run_audit 1.8.1.1 "Ensure message of the day is configured properly (Scored)" marked1
run_audit 1.8.1.2 "Ensure local login warning banner is configured properly (Scored)" marked1
run_audit 1.8.1.3 "Ensure remote login warning banner is configured properly (Scored)" marked1
run_audit 1.8.1.4 "Ensure permissions on /etc/motd are configured (Scored)" marked1
run_audit 1.8.1.5 "Ensure permissions on /etc/issue are configured (Scored)" marked1
run_audit 1.8.1.6 "Ensure permissions on /etc/issue.net are configured (Scored)" marked1
run_audit 1.8.2 "Ensure GDM login banner is configured (Scored)" marked1
run_audit 1.9 "Ensure updates, patches, and additional security software are installed (Not Scored)" marked1 1
run_audit 1.10 "Ensure system-wide crypto policy is not legacy (Scored)" marked1
run_audit 1.11 "Ensure system-wide crypto policy is FUTURE or FIPS (Scored)" marked1
echo ===============================================
echo ===============================================
echo "Marks for Initial Setup"
echo ----------------------------------------------------
echo "Score: $marks_initial_score/$total_marks_initial" 

echo ----------------------------------------------------
echo "Marks for Services"
echo "Score: $marks_services_score/$total_unmarks_services"

echo ----------------------------------------------------
echo "Marks for Network Configuration" 
echo "Score: $marks_network_score/$total_marks_network"

echo ----------------------------------------------------
echo "Marks for Logging and Auditing"
echo "Score: $marks_logging_score/$total_marks_logging" 

echo ----------------------------------------------------
echo "Marks for Access, Authentication and Authorization"
echo "Score: $marks_access_score/$total_marks_access" 

echo ----------------------------------------------------
echo "Marks for System Maintenance"
echo "Score: $marks_system_score/$total_marks_system"

echo ----------------------------------------------------

echo "Detailed output has been provided in data format as $audit_time.csv" 
