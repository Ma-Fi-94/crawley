#!/bin/bash

#List of directories to be searched
directories=(`ls -d */`)

#Import list of search terms
declare -a findstrings
readarray -t findstrings < wordlist.config

####################################################

clear
tabs 24
printf "******************************\n"
printf "Crawley Multi-Tracer Tool v1.0\n"
printf "******************************\n\n"
echo "Analyzing keywords: ${findstrings[@]}"
echo "Analyzing directories: ${directories[@]}"
printf "\n"


# Print header line: column names
printf "nb_records"
for keyword in "${findstrings[@]}"
do
	printf ",$keyword"
done
printf "\n"

# Print one line per analysed directory
for direc in "${directories[@]}"
do
	cd $direc
	n=`ls | wc -l`
	printf "$n"
	for keyword in "${findstrings[@]}"
	do
		x=`grep -roh $keyword . | wc -w`
		printf ",$x"
	done
	cd ..
	printf "\n"
done

tabs 4

