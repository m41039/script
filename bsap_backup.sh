# !/bin/bash
# Purpose = backup bsap zip file to NA( 172.30)
# Contact window = Gary Cho(8552), Mickey (8385)
# Create by 27 June 2017

date=`date +%Y%m%d`

cp /opt/others/bsap_export/1111/"$date"_FFO_C.zip  /opt/others/bsap_upload/508/
cp /opt/others/bsap_export/1111/"$date"_FFO_J.zip  /opt/others/bsap_upload/509/
cp /opt/others/bsap_export/1111/"$date"_FFO_S.zip  /opt/others/bsap_upload/510/
cp /opt/others/bsap_export/yes123/"$date"_YES_C.zip  /opt/others/bsap_upload/511/
cp /opt/others/bsap_export/yes123/"$date"_YES_J.zip  /opt/others/bsap_upload/512/
cp /opt/others/bsap_export/518/"$date"_518_CnJ.zip  /opt/others/bsap_upload/513/
cp /opt/others/bsap_export/518/"$date"_518_R.zip  /opt/others/bsap_upload/514/
cp /opt/others/bsap_export/518/"$date"_518_H.zip  /opt/others/bsap_upload/527/
cp /opt/others/bsap_export/ejob/"$date"_EJOB_CnJ.zip  /opt/others/bsap_upload/515/
cp /opt/others/bsap_export/ejob/"$date"_EJOB_R.zip  /opt/others/bsap_upload/516/
cp /opt/others/bsap_export/okwork/"$date"_OKWork_CnJ.zip  /opt/others/bsap_upload/517/
cp /opt/others/bsap_export/178/"$date"_178_CnJ.zip  /opt/others/bsap_upload/94820303538487442/

echo `date +%y%m%d_%H:%M` >> /home/mickeywang/bsap_backup_log.txt
