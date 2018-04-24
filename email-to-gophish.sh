#!/bin/bash

############################################################################################
# email-to-gophish.sh:   Extract emails from file and output to GoPhish CSV upload format
# Author:   VIVI | <Blog: thevivi.net> | <Twitter: @_theVIVI> | <Email: gabriel@thevivi.net> 
############################################################################################

if [ "$1" == "-h" ]; then
  echo "email-to-gophish.sh: Extract emails from file and output to GoPhish CSV upload format"
  echo "Usage: ./`basename $0` Email_List.txt > output_file.csv"
  exit 0
fi

if [ -f "$1" ]; then
	printf '%s\n' "First Name" "Last Name" "Email" "Position" | paste -sd ','
	for e in $(grep -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*' "$1" | sort | uniq -i)
	do
	#echo "${first_name}"
	printf '%s\n' "$(echo "${e}"| cut -d@ -f1)" "LAST_NAME" $e "POSITION" | paste -sd ','
	done
	
else
	echo "Error: No file to read specified." >&2
	echo "Usage: ./`basename $0` Email_List.txt > output_file.csv"
	exit 1
fi