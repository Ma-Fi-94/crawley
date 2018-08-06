#!/bin/bash
# Copyright 2018 Ma-Fi-94

read -p "Press any key to continue or CTRL-C to abort..."
clear
printf "***********************\n"
printf "Crawley v1.0 -- Crawler\n"
printf "***********************\n\n"

# Desired name of the log file goes here
logfile="/home/mmf/Crawley/crawley.log"

# Read URL list of sites to be crawled
declare -a sites
readarray -t sites < hostlist.config

# Setting up directory for downloaded files
dir=downloads_`date +%Y%m%d_%H%M%S`
printf "Saving download to folder $dir \n"
if [[ ! -e $dir ]]; then
    mkdir $dir
fi
cd $dir
rm * &> /dev/null

# Logging ...
printf "`date` \t Starting Crawley v1.0 crawler \n" >> "$logfile"
printf "`date` \t Sites: ${sites[*]} \n" >> "$logfile"

#Crawling desired URLs
for site in "${sites[@]}"
do
	echo "********** Crawling page $site ************"
	printf "`date` \t Crawling Site: $site \n" >> "$logfile"
	wget --header="Accept: text/html" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" --recursive --level=1 --no-directories "$site" &>/dev/null
	printf "`date` \t ...done \n" >> "$logfile"
done

#Print info on screen ...
printf "Downloaded `ls | wc -w` files in total. \n"
printf "Removing unnecessary files... \n"

# ... and to logfile
printf "`date` \t Downloaded `ls | wc -w` files in total. \n" >> "$logfile"
printf "`date` \t Removing unnecessary files \n" >> "$logfile"

#Removing non-HTML files (such as scripts)
shopt -s extglob
rm -v -- !(*.htm|*.html) &>/dev/null
shopt -u extglob

#Print info on screen ...
printf "`ls | wc -w` files remaining.\n"
printf "Converting files to lowercase... \n"

# ... and to logfile
printf "`date` \t `ls | wc -w` files remaining.\n" >> "$logfile"
printf "`date` \t Converting files to lowercase \n" >> "$logfile"

# Converting all files to lowercase for faster searching later
for filename in *
do
	sed -i 's/\(.*\)/\L\1/' $filename &>/dev/null
done

#Print info on screen ...
printf "...done. \n"
printf "Terminating successfully \n\n\n"

# ... and to logfile
printf "`date` \t ...done. \n" >> "$logfile"
printf "`date` \t Terminating successfully \n\n\n" >> "$logfile"

