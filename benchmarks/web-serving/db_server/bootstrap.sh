#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Web server IP is a mandatory parameter."
  exit 1
fi

WEB_SERVER_IP=$1

#workaround for mysql for running benchmark on ubuntu16.04
find /var/lib/mysql -type f -exec touch {} \;
# Update the hostname/IP to that of the webserver
sed -i -e"s/HOST_IP/${WEB_SERVER_IP}:8080/" /elgg_db.dump
chmod a+x /execute.sh
sync
bash -c "/execute.sh root" #root is the root pass
