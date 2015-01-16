#!/bin/bash

if [ ! -d /var/lib/mysql/mysql ]; then
    echo 'Rebuilding mysql data dir and allowing root to connect from everywher'

    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db --user=mysql

    echo 'Allow root to connect from everywhere';
    service mysql start
    mysqladmin --silent --wait=30 ping
    # Extract debian-sys-maint password
    PASSWORD=$(sed -ne "0,/password *= *\(.*\)/{s/password *= *\(.*\)/\1/p}" /etc/mysql/debian.cnf)
    mysql -e 'GRANT ALL PRIVILEGES ON *.* TO "debian-sys-maint"@"localhost" IDENTIFIED BY "'${PASSWORD}'"';
    mysql -e 'GRANT ALL PRIVILEGES ON *.* TO "root"@"%" WITH GRANT OPTION;'
    service mysql stop
fi

mysqld
