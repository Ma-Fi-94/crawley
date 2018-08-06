# crawley
An older project of mine, written in bash. A collection of shell scripts for crawling webpages, counting the number of occurences of keywords, tracing them over time and analysing correlations.

## Overview:
* **'crawler.sh'** is the actual crawler. It reads the list of webpages to be crawled from the file **'hostlist.config'**, visits them one after another and follows all links on them. All webpages in the 'hostlist.config' file and all webpages linked on them are saved into a directory names 'downloads_date_time' using wget and converted to lowercase afterwards. All non-HTML pages (such as scripts) are removed beforehand. Activities are logged into a log file whose name can be specified in the script.
* **'search_one_folder_multiple_keywords.sh'** is exactly what it says on the tin ;). The script reads all keywords from the file **'wordlist.config'** and counts the number of occurences of all these keywords in one selected download folders passed as first command line argument. If '-R' is passed as second command line argument, the output will be formatted so that it can be read directly into R (comma seperated, no line breaks). Otherwise, classical long output is used, which lists the number of occurences of each keyword in a single line.
* **'search_all_folders_multiple_keywords.sh'** is exactly the same as above, but analyses **all** existing download folders.
* **'search_all_folders_single_keyword.sh'** can be used for quickly tracing the frequency of one single keyword passed as command line argument #1 through all download folders.
