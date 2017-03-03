#!/bin/bash
#Program
#This script will show "run ap command"
#History
#2017/03/02 First Gengeration
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

SHELL=/bin/bash

echo "/opt/scripts/batch/ap_cron.sh $1 >/opt/AP/Patch_log/$1/console.log 2>&1 &"
