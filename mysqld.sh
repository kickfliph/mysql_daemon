#!/bin/bash
EMAIL="luisedgardoortiz@gmail.com"
SERVICE='mysqld'
NAME='hostname'
STATUS='pgrep $SERVICE | wc -l'
if [ $STATUS -ne 1 ]
then
    ps -ef | grep $SERVICE | grep -v grep | awk '{print $2}' | xargs kill
    service $SERVICE start
    echo "Mysql Server Restarted at: `date`" |mail -s "Alert ($NAME) : Mysql Service is not running (Manually Restarted)" $EMAIL
fi
