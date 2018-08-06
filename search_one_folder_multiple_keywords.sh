#!/bin/bash

#Get directory to be searched from command line
directory=$1

#Read strings to be searched from 'wordlist.config'
declare -a findstrings
readarray -t findstrings < wordlist.config

#Setup
cd $directory
clear
tabs 20

printf "************************\n"
printf "Crawley Finder Tool v1.0\n"
printf "************************\n\n"
printf "Analyzing directory: $directory \n"
printf "Total number of records: `ls | wc -l` \n\n"

printf "\n"

# Command line parameter $2 sets output format so that output can
# be read directly into R (comma seperated, no line breaks)
if [ "$2" == "-R" ]
	then
		for strg in "${findstrings[@]}"
		do
			printf "$strg,"

		done
		printf "\n"

		for strg in "${findstrings[@]}"
		do
			x=`grep -roh $strg . | wc -w`
			printf "$x,"
		done
		printf "\n"
	else
		for strg in "${findstrings[@]}"
		do
			x=`grep -roh $strg . | wc -w`
			printf "$strg \t\t $x\n"

		done
		printf "\n"
fi
tabs 4

