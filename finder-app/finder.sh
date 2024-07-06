#!/bin/bash


# check the number of arguments
if [ $# -ne 2 ]; then
	echo "Missing arguments.  Expecting two arguments filedir and searchstr.  Ex: ./finder-app.sh /tmp/aesd/assignment1 linux"
	exit 1
fi


# check the first argument is an actual directory
if [ ! -d $1 ]; then
	echo "Directory does not exist"
	exit 1
fi


# both checks passed, find number of files and matching string search

file_count=`ls $1 | wc -l`

match_count=`grep -r $2 $1 | wc -l`


echo "The number of files are $file_count and  the number of matching lines are  $match_count"
