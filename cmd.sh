#!/bin/bash

echo "##########################################start set init password#################################################################"

cd /usr/share/doc/zabbix-server-mysql
gunzip create.sql.gz
sed -i "s/\$2y\$10\$92nDno4n0Zm7Ej7Jfsz8WukBfgSS\/U0QkIuu8WkJPihXBb2A1UrEK/$app_pass/g" create.sql
gzip create.sql
/usr/bin/tini -- /usr/bin/docker-entrypoint.sh /usr/sbin/zabbix_server --foreground -c/etc/zabbix/zabbix_server.conf
