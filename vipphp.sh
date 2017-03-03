#!/bin/bash
#This is Mickey's first script
#This script will {start|stop|restart} vipphp sql service when DB deadlock
#2017/02/10  Frist release
now="$(date +'%Y%m%d')"

######Stop A10
case $1 in
stop) 

sudo /script/_mic/maintain/sigt_deny.sh;sleep 3;tail -f /opt/httpd/logs/access_vip_io_log"$now"
;;

######Restart Sql
restart)

/script/webuse/wlc/vip_startwlc.sh
;;

#######Start A10 and check log
start)

sudo /script/_mic/maintain/sigt_allow.sh;sleep 3;tail -f /opt/httpd/logs/access_vip_io_log"$now"
;;

*)
echo $"Usage: {start|stop|restart}"
        exit 1
        ;;
esac
