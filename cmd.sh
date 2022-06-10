#!/bin/bash

echo "##########################################start set init password#################################################################"

app_pass=$(htpasswd -bnBC 10 "" $APP_PASSWORD | tr -d ':')
echo $app_pass
sed -i "s/$2y$10$92nDno4n0Zm7Ej7Jfsz8WukBfgSS\/U0QkIuu8WkJPihXBb2A1UrEK/$app_pass/g" ?

/usr/bin/docker-entrypoint.sh
