#!/bin/bash -e
set -e
##########################################
## REFERENCE PAGES                      ##
## https://askubuntu.com/a/865569       ##
## https://stackoverflow.com/a/44254088 ##
##########################################
create_box (){
	output="$@"
	greatestLength=0
	for i in "${output[@]}"
	do
		if [ $greatestLength -lt ${#i} ]; then
			greatestLength=${#i}
		fi
	done

	# section for printing top border
	echo; for i in $(seq $(($greatestLength + 8))); do echo -n "#"; done; echo
	echo -n "###"; for i in $(seq $(($greatestLength + 2))); do echo -n " "; done; echo "###"

	# sectiom for printing logs
	for i in "${output[@]}"
	do
		echo -tn "### "$i
		for i in $(seq $(($greatestLength - ${#i} +1 ))); do echo -n " "; done;
		echo "###"
	done
	
	# section for printing bottom border
	echo -n "###"; for i in $(seq $(($greatestLength + 2))); do echo -n " "; done;	echo "###"	
	for i in $(seq $(($greatestLength + 8))); do echo -n "#"; done;
	echo

}

if [ -f /etc/os-release ]; then
	. /etc/os-release
	if [ $ID == "ubuntu"]; then
		if [ $VERSION_ID == "14.04" ]; then
			option[0]="This appears to be an Ubuntu 14.04..."
			option[1]="Adding ppa:jonathonf/python-3.6 repository"
			option[2]="With the following packages: "
			option[3]="\tpython3.6"
			option[4]="\tpython3.6-dev"
			option[5]="Please note that due to a dependency issue with python-pip-whl"
			option[6]="python3-venv and pip3 for python3.6 will not be installed"
			create_box $output
			sudo add-apt-repository ppa:jonathonf/python-3.6 -y
			sudo apt-get -y update
			sudo apt-get install -y python3.6 python3.6-dev 
		elif [ $VERSION_ID == "16.04" ]; then
			option[0]="This appears to be an Ubuntu 16.04..."
			option[1]="Adding ppa:jonathonf/python-3.6 repository"
			option[2]="With the following packages: "
			option[3]="\tpython3.6"
			option[4]="\tpython3.6-dev"
			option[5]="\tpython3.6-venv"
			option[6]="\tpython3.6-pip"
			create_box $output
			sudo add-apt-repository ppa:jonathonf/python-3.6 -y
			sudo apt-get -y update
			sudo apt-get install -y python3.6 python3.6-dev python3.6-venv
			wget https://bootstrap.pypa.io/get-pip.py
			sudo python3.6 get-pip.py
		elif [ $VERSION_ID == "17.10" ]; then
			option[0]="This appears to be an Ubuntu 17.10..."
			option[1]="No need to add third-party repo as python3.6 is supported"
			option[2]="Via Ubuntu repos"
			option[3]="\tpython3.6"
			option[4]="\tpython3.6-dev"
			option[5]="\tpython3.6-venv"
			option[6]="\tpython3.6-pip"
			create_box $output
			sudo apt-get -y update
			sudo apt-get install -y python3 python3-venv python3-pip
		fi
	fi
fi