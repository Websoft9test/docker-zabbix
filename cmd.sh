while true
do
    field_lines=`mysql -uroot -p$APP_PASSWORD -h 127.0.0.1 -NBe "select count(*) from zabbix.users where  surname='Administrator';"`
    sleep 3
    if [ $field_lines -ge  1 ];then
        break
    fi
done

while true
do
    password_lines=`mysql -uroot -p$APP_PASSWORD -h 127.0.0.1 -NBe "select count(*) from zabbix.users where  length(passwd) < 60;"`
    sudo mysql -uroot -p"$APP_PASSWORD" -h 127.0.0.1 -e "update zabbix.users set passwd=md5('$APP_PASSWORD') where surname='Administrator';"
    sleep 3
    if [ $password_lines -ge  1 ];then
       break
    fi
done
