#!/bin/bash
#This is Mickey's second script
#This script will {start|stop|restart} vippmx sql service when DB deadlock
#2017/02/22  Frist release

now="$(date +'%Y%m%d')"
hour=`date +'%H'`
if [ $hour -le 12 ];then
        shit=00
else
        shit=12
fi
######Stop A10
case $1 in
stop)

/script/_mic/maintain/sigt_deny.sh;sleep 3;tail -f /opt/httpd/logs/io_access_log$now$shit
#echo /opt/httpd/logs/access_vip_io_log$now$shit
;;

######Restart Sql
restart)

/script/webuse/wlc/vip_startwlc.sh
;;

#######Start A10 and check log
start)

/script/_mic/maintain/sigt_allow.sh;sleep 3;tail -f /opt/httpd/logs/io_access_log$now$shit
;;

*)
echo $"Usage: {start|stop|restart}"
        exit 1
        ;;
esac
