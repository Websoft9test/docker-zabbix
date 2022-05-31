while true
do
    field_lines=`mysql -uroot -p$APP_PASSWORD -h mysql -NBe "select count(*) from zabbix.users where  surname='Administrator';"`
    sleep 3
    if [ $field_lines -ge  1 ];then
        break
    fi
done

while true
do
    password_lines=`mysql -uroot -p$APP_PASSWORD -h mysql -NBe "select count(*) from zabbix.users where  length(passwd) < 60;"`
    mysql -uroot -p"$APP_PASSWORD" -h mysql -e "update zabbix.users set passwd=md5('$APP_PASSWORD') where surname='Administrator';"
    sleep 3
    if [ $password_lines -ge  1 ];then
       break
    fi
done
echo "admin password edit complete" >> /tmp/log.txt
tail -f /dev/null
