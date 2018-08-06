# crawley
An older project of mine, written in bash. A collection of shell scripts for crawling webpages, counting the number of occurences of keywords, tracing them over time and analysing correlations.

## Overview:
* **'crawler.sh'** is the actual crawler. It reads the list of webpages to be crawled from the file **'hostlist.config'**, visits them one after another and follows all links on them. All webpages in the 'hostlist.config' file and all webpages linked on them are saved into a directory names 'downloads_date_time' using wget and converted to lowercase afterwards. All non-HTML pages (such as scripts) are removed beforehand.
