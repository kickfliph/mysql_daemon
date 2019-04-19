#!/bin/bash
EMAIL="luisedgardoortiz@gmail.com"
NAME=`hostname`
STATUS=`pgrep mysql | wc -l`
echo "$STATUS"

if [ $STATUS -ne 2 ];
then
    service mysql start
    echo "Mysql Server Restarted at: `date`" | mail -s "Alert ($NAME) : Mysql Service is not running (Manually Restarted)" $EMAIL
fi
