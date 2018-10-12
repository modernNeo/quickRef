#!/bin/bash
COMMAND_FILE_LOCATION="$HOME/GitHub/quickRef/commands.json"
GIT_FILE_LOCATION="$HOME/GitHub/quickRef/gitOptions.json"

create_array_of_quickref_names(){
	index=0
	FILE_TO_QUERY=$1
	KEY_TO_QUERY=$2
	output=`cat "$FILE_TO_QUERY" | jq ".${KEY_TO_QUERY}[${index}].name" -r`
	while [ "$output" != null ]
	do
		quickReferenceNames[$index]=`cat "$FILE_TO_QUERY" | jq ".${KEY_TO_QUERY}[${index}].name" -r`
		index=$(($index+1))
		output=`cat "$FILE_TO_QUERY" | jq ".${KEY_TO_QUERY}[${index}].name" -r`
	done
}

print_specified_index(){
	innerIndex=0
	FILE_TO_QUERY=$1
	KEY_TO_QUERY=$2
	INDEX_TO_QUERY=$3
	output=`cat "$FILE_TO_QUERY" | jq ".${KEY_TO_QUERY}[${INDEX_TO_QUERY}].description[${innerIndex}]" -r`
	while [ "$output" != null ]
	do
		isExec=`cat "$FILE_TO_QUERY" | jq ".${KEY_TO_QUERY}[${INDEX_TO_QUERY}].exec" -r`
		if [ "$isExec" == "true" ]; then
			eval "$output"
			exit
		fi
		echo "$output"
		innerIndex=$(($innerIndex+1))
		output=`cat "$FILE_TO_QUERY" | jq ".${KEY_TO_QUERY}[${INDEX_TO_QUERY}].description[${innerIndex}]" -r`
	done
}

##takes the different options from commands.json and displays them for the user
quickReferenceNames=''
create_array_of_quickref_names "$COMMAND_FILE_LOCATION" "commands"
index=0
for line in "${quickReferenceNames[@]}"
do
	echo -e "\t"$line" ["$(($index+1))"]"
	index=$(($index+1))
done

#reads the option that the user wants and determines if it is a regular option selected or a git option that requires further work
read option
if [ $option -ne 2 ]; then
	print_specified_index "$COMMAND_FILE_LOCATION" "commands" $((option-1))
	exit
fi

#has determined that it is a git option and therefore needs to read and print another menu for the user to pick
#which command they need to brush up on
quickReferenceNames=''
create_array_of_quickref_names "$GIT_FILE_LOCATION" "gitOptions"
index=0
for line in "${quickReferenceNames[@]}"
do
	echo -e "\t"$line" ["$(($index+1))"]"
	index=$(($index+1))
done
read gitOption
print_specified_index "$GIT_FILE_LOCATION" "gitOptions" $(($gitOption-1))