# !/bin/bash
# Program
# This shell script will apply default system setting for new machine(centos)
# which include (hostname/ip/subnet/dns/mount point)
# History
# 2017/03/09 First edition
#
#
# check list
# /etc/hosts  ==>Hostname
# /etc/sysconfig/network ==>Gateway info
# /etc/sysconfig/network-script/ifcfg-eth0  ==>NetCardsetting
# /etc/resolv.conf ==>Nameserver
# 

LAB_Gateway=172.19.1.252
STG_Gateway=172.30.0.1
LAB_DNS=(10.0.1.5 10.0.1.6)

LAB_CLASS=$(echo $LAB_Gateway |awk -F. '{print $1"."$2')
STG_CLASS=$(echo $STG_Gateway |awk -F. '{print $1"."$2')


# Modify /etc/hosts
read -p "Please enter your IP address: " Ip
read -p "Please enter your Hostname: " Hostname
	
addhosts(){	
	echo ${Ip} ${Hostname} >> /etc/hosts
}

# Add Hostname /etc/sysconfig/network file
sed -i "s/HOSTNAME=.*/HOSTNAME=${Hostname}/g" /etc/sysconfig/network

# Add gateway /etc/sysconfig/network file
IP=$(echo ${Ip} | awk -F. '{print $1"."$2}')
if [ "${IP}" == "$LAB_CLASS" ];then
    sed -i "s/GATEWAY=.*/GATEWAY=172.19.1.252/g" /etc/sysconfig/network

elif [ "${Ip}" == "$STG_CLASS" ];then
    sed -i "s/GATEWAY=.*/GATEWAY=172.30.0.1/g" /etc/sysconfig/network


# Add DNS /etc/resolv.conf
echo ddd > resolv.conf


