#!/bin/bash

volumes=($(ls -l /mnt | awk '{print $9}' | grep -v '^$'))
echo "which volume?: " ${volumes[*]}
read option

for index in ${volumes[@]}; do
	if [ $index == $option ]; then
		sudo mkdir -p /mnt/$index
		sudo mount -t drvfs "$(tr '[:lower:]' '[:upper:]' <<< $index)": /mnt/$index
		exit
	fi
done
