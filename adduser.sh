#!/bin/bash
#
# This Script will insert user:gary to sudoer on BSAP machines
# to run BSAP AP himself
#
USER=gary
PASSWD=gary978

# Adduser gary and set passwd
adduser $USER
echo $PASSWD | passwd "$USER" --stdin

# Add Gary to sudoers
echo 'gary  ALL=(ALL:ALL) ALL' >> /etc/sudoers

# Set PATH to user gary
sed -i "s|PATH=.*|PATH=/usr/lib/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin/|g"  .bashrc
source ~/.bashrc