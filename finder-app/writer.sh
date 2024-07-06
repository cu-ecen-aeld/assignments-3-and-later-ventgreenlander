#!/bin/bash

# check the number of arguments
if [ $# -ne 2 ]; then
	echo "Missing arguments.  Expecting two arguments file path and text string.  Ex: ./writer.sh /tmp/aesd/assignment1/sample.txt ios"
	exit 1
fi


# get the directory path first to check if it exists or not
dir_path=`echo $1 | xargs dirname`


# check if it is a directory
if [ ! -d $dir_path ]; then
	echo "Directory does not exist"
	`mkdir -p $dir_path`
	
	# get the result of mkdir and compare it to 0 - success
	dir_cre=$?

	echo "dir_cre: $dir_cre"
	if [ $dir_cre -eq 0 ]; then
		echo "Directory created"
	else
		echo "Failed to create the directory"
		exit 1
	fi
fi

# reached this point, none of the previous checks failed
echo $2 > $1

echo "File created successfully"
exit 0
