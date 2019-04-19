#!/bin/bash
EMAIL="luisedgardoortiz@gmail.com"
SERVICE='mysqld'
NAME='hostname'
if [[ ! "$(service $SERVICE status)" =~ "start/running" ]]
then
    ps -ef | grep $SERVICE | grep -v grep | awk '{print $2}' | xargs kill
    service $SERVICE start
    echo "Mysql Server Restarted at: `date -I`" |mail -s "Alert ($NAME) : Mysql Service is not running (Manually Restarted)" $EMAIL
fi
