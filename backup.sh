#!/bin/bash
dt=`date +%y%m%d`

mkdir backup-$dt
mkdir backup-$dt/client
mkdir backup-$dt/client/app
mkdir backup-$dt/client/app/images

mysqldump --defaults-file=/home/proved/.my.cnf db_net_broker > backup-$dt/db_net_broker_$dt.sql

cp -R /var/www/netbroker/client/app/files backup-$dt/client/app
cp -R /var/www/netbroker/client/app/images/user backup-$dt/client/app/images/user
cp -R /var/www/netbroker/client/app/images/main_categories backup-$dt/client/app/images/main_categories

tar -zcvf backup-$dt.tar.gz backup-$dt
rm -R backup-$dt
