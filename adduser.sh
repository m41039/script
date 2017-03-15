#!/bin/bash
#
# This Script will insert user:gary to sudoer on BSAP machines
# to run BSAP AP himself
#
USER=gary
PASSWD=gary978

# Adduser gary and set passwd
#PATH=/usr/lib/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
#export $PATH

adduser $USER
echo $PASSWD | passwd "$USER" --stdin

# Add Gary to sudoers
echo 'gary  ALL=(ALL:ALL) ALL' >> /etc/sudoers