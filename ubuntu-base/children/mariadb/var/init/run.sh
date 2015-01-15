#!/bin/bash

if [ ! -d /var/lib/mysql/mysql ]; then
    echo 'Rebuilding mysql data dir'
    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db > /dev/null

    echo 'Allow root to connect from everywhere';
    service mysql start
    mysqladmin --silent --wait=30 ping
    mysql -e 'GRANT ALL PRIVILEGES ON *.* TO "root"@"%" WITH GRANT OPTION;'
    service mysql stop
fi

mysqld
