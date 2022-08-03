#!/bin/bash
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
clear

apt-get install apache2-utils -y 1>/dev/null 2>&1
yum install httpd-tools -y 1>/dev/null 2>&1

app_pass=$(htpasswd -bnBC 10 "" $1 | tr -d ':')
echo $app_pass
