#!/bin/bash

# Command line argument 1: Keyword to be searched for in all folders
keyword=$1

# List of all directories to be analysed
directories=(`ls -d */`)

clear
tabs 24
printf "************************\n"
printf "Crawley Tracer Tool v1.0\n"
printf "************************\n\n"
printf "Analyzing keyword: $keyword \n"
printf "\n"

# Command line parameter $2 sets output format so that output can
# be read directly into R (comma seperated, no line breaks)
if [ "$2" == "-R" ]
	then
		# First line: Directory names
		for direc in "${directories[@]}"
		do
			printf "$direc, "
		done
		printf "\n"

		# Second line: Nb. of occurences in the specific directory
		for direc in "${directories[@]}"
		do
			cd $direc
			x=`grep -roh $keyword . | wc -w`
			printf "$x, "
			cd ..
		done
	else
		# Long output format as a table with directory name, nb. of records
		# and nb. of occurences in three columns.
		printf "Directory \t Nb. Records \t Nb. Findings\n"
		for direc in "${directories[@]}"
		do
			cd $direc
			rec=`ls | wc -l`
			x=`grep -roh $keyword . | wc -w`
			printf "$direc \t $rec \t $x \n"
			cd ..
		done
fi
printf "\n\n"
tabs 4

