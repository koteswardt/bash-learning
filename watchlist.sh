#! /bin/bash

#This script helps in finding the user name who's making errors.
targerPath="/home/parallels/scripts/bash/app_logs"
watchlistFun(){
    if [ -d "$1" ]; then
        echo "Its a directory"
       cultprit=$(awk 'toupper($0) ~ /ERROR/ {print $3}' "$1/access.log" | sort | uniq -c | sed 's/User://' | sort -nr )
       report_logFile="$1/security_audit"
       if [ ! -f "$report_logFile" ]; then
           touch $report_logFile
           echo "the culprit whos creating error is $cultprit" > "${report_logFile}_$(date +%F).txt"
       fi
       if [ -f "$report_logFile" ]; then
            echo "the culprit whos creating error is: $cultprit" > "${report_logFile}_$(date +%F).txt"
       fi     
   
    fi   
}

watchlistFun "$targerPath" 
