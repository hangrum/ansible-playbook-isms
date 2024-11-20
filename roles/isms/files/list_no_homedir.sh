#!/bin/bash

# Define the input file containing the list of files/directories
input_file="/var/tmp/U_homedir"

if [ -e "$input_file" ]; then
    rm "$input_file"
fi

sudo cat /etc/passwd | egrep -v 'nologin|false' | cut -d : -f 6 > $input_file

# Define the output file to store the list of files/directories that do not exist
output_file="/var/tmp/U_no_homedir"

# Check if the output file already exists and delete it if it does
if [ -e "$output_file" ]; then
    rm "$output_file"
fi

# Loop through each line in the input file
while IFS= read -r line; do
    # Check if the file/directory exists
    if [ ! -e "$line" ]; then
        # If it doesn't exist, append it to the output file
        echo "$line" >> "$output_file"
    fi
done < "$input_file"

if [ -e "$input_file" ]; then
    rm "$input_file"
fi


#Make diretory and remove output_file

if [ -e "$output_file" ]; then
	for i in $(cat $output_file);
	do mkdir $i;
	done
fi

if [ -e "$output_file" ]; then
    rm "$output_file"
fi
