# !/bin/bash
# Purpose = backup bsap zip file to NA( 172.30)
# Contact window = Gary Cho(8552), Mickey (8385)
# Create by 27 June 2017

date=`date +%Y%m%d`

rsync -arvh /opt/others/bsap_export/1111/*_FFO_C.zip  /opt/others/bsap_upload/508/
rsync -arvh /opt/others/bsap_export/1111/*_FFO_J.zip  /opt/others/bsap_upload/509/
rsync -arvh /opt/others/bsap_export/1111/*_FFO_S.zip  /opt/others/bsap_upload/510/
rsync -arvh /opt/others/bsap_export/yes123/*_YES_C.zip  /opt/others/bsap_upload/511/
rsync -arvh /opt/others/bsap_export/yes123/*_YES_J.zip  /opt/others/bsap_upload/512/
rsync -arvh /opt/others/bsap_export/518/*_518_CnJ.zip  /opt/others/bsap_upload/513/
rsync -arvh /opt/others/bsap_export/518/*_518_R.zip  /opt/others/bsap_upload/514/
rsync -arvh /opt/others/bsap_export/twjob/*_TW_CnJ.zip  /opt/others/bsap_upload/515/
rsync -arvh /opt/others/bsap_export/twjob/*_TW_R.zip  /opt/others/bsap_upload/516/
rsync -arvh /opt/others/bsap_export/okwork/*_OKWork_CnJ.zip  /opt/others/bsap_upload/517/
rsync -arvh /opt/others/bsap_export/178/*_178_CnJ.zip  /opt/others/bsap_upload/94820303538487442/

echo `date +%y%m%d_%H:%M` >> /home/mickeywang/bsap_backup_log.txt
