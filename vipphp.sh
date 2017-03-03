#!/bin/bash
#This is Mickey's first script
#This script will {start|stop|restart} vipphp sql service when DB deadlock
#2017/02/10  Frist release
now="$(date +'%Y%m%d')"

######Stop A10
case $1 in
stop) 

/script/_mic/maintain/sigt_deny.sh;sleep 3;tail -f /opt/httpd/logs/access_vip_io_log"$now"
;;

######Restart Sql
restart)

/script/webuse/sqlrelay/sqlr46_wspjb.sh stop ; ps -ef | grep sql | awk '{print $2}' | xargs kill -9 ;  /script/webuse/sqlrelay/sqlr46_wspjb.sh restart ;  /opt/httpd/bin/apa
chectl -k restart ;  /usr/bin/lynx --dump --source "http://`hostname --ip-address`/monitor/check_odbc.php"
;;

#######Start A10 and check log
start)

/script/_mic/maintain/sigt_allow.sh;sleep 3;tail -f /opt/httpd/logs/access_vip_io_log"$now"
;;

*)
echo $"Usage: {start|stop|restart}"
        exit 1
        ;;
esac
