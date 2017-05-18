SHELL=/bin/bash

for i in $(cat apno.txt);
do 
   echo "/opt/scripts/batch/ap_cron.sh $i >/opt/AP/Patch_log/$i/console.log 2>&1 &"

done
