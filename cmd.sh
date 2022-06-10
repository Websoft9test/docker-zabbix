#!/bin/bash

#!/bin/bash

echo "##########################################start set init password#################################################################"

sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
yum update -y
yum install httpd -y

app_pass=$(htpasswd -bnBC 10 "" $APP_PASSWORD | tr -d ':')
echo $app_pass

cd /usr/share/doc/zabbix-server-mysql
gunzip create.sql.gz
sed -i "s/\$2y\$10\$92nDno4n0Zm7Ej7Jfsz8WukBfgSS\/U0QkIuu8WkJPihXBb2A1UrEK/$app_pass/g" create.sql
gzip create.sql
/usr/bin/tini -- /usr/bin/docker-entrypoint.sh /usr/sbin/zabbix_server --foreground -c/etc/zabbix/zabbix_server.conf
